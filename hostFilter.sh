#!/bin/bash -      
###name			:hostFilter : Protect your computer and block undesired content.
###description		:hostFilter is a bash script used to prevent your computer from connecting to some websites and servers that are known to contain malicious content, including viruses, spyware, Trojans, web pages that engage in phishing attacks, spam, phorm, shocking or violent content, prevent annoying pop-ups, block ad servers..etc. This will reduce the bandwidth use and protect your computer from malicious softwares. Please forward any suggestion by email to amri.aymen@gmail.com
#			-h --help : Display this message.
#			-i : Run the script.
###usage		:hostFilter.sh [OPTION]
###notes           	:First chmod +x this script, install Sed (http://www.gnu.org/software/sed/ ), and run it as a root.
###author		:amri.aymen@gmail.com
###website		:https://github.com/eon01/hostFilter
###date            	:26/10/2013
###version         	:0.4    
###license		:GNU GENERAL PUBLIC LICENSE Version 2
###bash_version    	:GNU bash, version 4.2.37(1)-release (i686-pc-linux-gnu)
#==============================================================================

help="hostFilter is a bash script used to prevent your computer from connecting to some websites and servers that are known to contain malicious content, including viruses, spyware, Trojans, web pages that engage in phishing attacks, spam, phorm, shocking or violent content, prevent annoying pop-ups, block ad servers..etc. This will reduce the bandwidth use and protect your computer from malicious softwares.
			-h --help : Display this message.
			-i : Run the script.

To run this script you should \n1/Install Sed \n2/Chmod +x the hostFilter.sh\n3/Run it as root.\n"

description="hostFilter is a bash script used to prevent your computer from connecting to some websites and servers that are known to contain malicious content, including viruses, spyware, Trojans, web pages that engage in phishing attacks, spam, phorm, shocking or violent content, prevent annoying pop-ups, block ad servers..etc. This will reduce the bandwidth use and protect your computer from malicious softwares.\n"

function list_cat { 
while true; do
    read -p "Do you wish to block $1 [y/n] ? : " yn
    case $yn in
        [Yy]* )
	wget -qO- $2 >> $3
	break;;
        [Nn]* )
	break;;
        * ) echo "Please answer y or n.";;
    esac
done
}



case "$1" in
	-h|--help)
	printf "\033c" 
	echo "$help"
        read -p "Press any key to exit."
	exit
	;;

	-i|'')
	printf "\033c" 
	#Make sure only root can run our script
	if [[ "$EUID" -ne 0 ]]; then
		echo "This script must be run as root" 1>&2
		exit 1
	else 
		out="$(mktemp)"
		printf "$description\n"
		list_cat "[2o7-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/2o7-sites  $out
		list_cat "[IVW-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/IVW-sites  $out
		list_cat "[ad-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/ad-sites  $out
		list_cat "[belo-interactive-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/belo-interactive-sites  $out
		list_cat "[cydoor-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/cydoor-sites  $out
		list_cat "[doubleclick-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/doubleclick-sites  $out
		list_cat "[e-card-scam-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/e-card-scam-sites  $out
		list_cat "[extreme-dm-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/extreme-dm-sites  $out
		list_cat "[fastclick-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/fastclick-sites  $out
		list_cat "[hijack-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/hijack-sites  $out
		list_cat "[hitbox-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/hitbox-sites  $out
		list_cat "[intellitxt-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/intellitxt-sites  $out
		list_cat "[malware-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/malware-sites  $out
		list_cat "[phorm-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/phorm-sites  $out
		list_cat "[popup-traps-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/popup-traps-sites  $out
		list_cat "[real-media-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/real-media-sites  $out
		list_cat "[red-sheriff-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/red-sheriff-sites  $out
		list_cat "[shock-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/shock-sites  $out
		list_cat "[spyware-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/spyware-sites  $out
		list_cat "[wiki-spam-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/wiki-spam-sites  $out
		list_cat "[yahoo-ad-sites]"   https://raw.github.com/eon01/hostFilter/master/lists/yahoo-ad-sites  $out

		list=$(cat $out)
		printf "\n"

		read -sn 1 -p "Press any key to continue...";printf "\n"	
		if egrep -q "#<?hostFilter>" /etc/hosts;then
			cp /etc/hosts{,.bak}
			sed -i '/#<hostFilter>/,/<\/hostFilter>/d' /etc/hosts 1&>2			
			echo -e "#<hostFilter>\n$list\n#</hostFilter>" >> /etc/hosts
		else 
			cp /etc/hosts{,.bak}
			echo -e "#<hostFilter>\n$list\n#</hostFilter>" >> /etc/hosts
		fi
		
		exit
		
	fi
	;;
	*)  
	printf "Illegal option: $1\n$help\n" >&2
	exit 1
	;;
esac


