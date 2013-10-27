#!/bin/bash -      
###name			:hostFilter : Protect your computer and save your bandwidth.
###description		:hostFilter is a bash script used to prevent your computer from connecting to some websites and servers that are known to contain 				 malicious content, including viruses, spyware, Trojans, web pages that engage in phishing attacks, spam, phorm, shocking or violent    			 content, prevent annoying pop-ups, block ad servers..etc. This will reduce the bandwidth use and protect your computer from malicious 				 softwares. Please forward any suggestion by email to amri.aymen@gmail.com
###usage		:hostFilter.sh [OPTION]
#			-h --help : Display this message.
#			-i : Run the script.
###notes           	:First chmod +x this script, install Sed (http://www.gnu.org/software/sed/ ), and run it as a root.
###author		:amri.aymen@gmail.com
###website		:https://github.com/eon01/hostFilter
###date            	:26/10/2013
###version         	:0.4    
###license		:GNU GENERAL PUBLIC LICENSE Version 2
###bash_version    	:GNU bash, version 4.2.37(1)-release (i686-pc-linux-gnu)
#==============================================================================

help="\nhostFilter is a bash script used to prevent your computer from connecting to some websites and servers that are known to contain malicious content, including viruses, spyware, Trojans, web pages that engage in phishing attacks, spam, phorm, shocking or violent content, prevent annoying pop-ups, block ad servers..etc. This will reduce the bandwidth use and protect your computer from malicious softwares.
			-h --help : Display this message.
			-i : Run the script.

To run this script you should : Install Sed . Chmod +x the hostFilter.sh . Run it as root."

description="hostFilter is a bash script used to prevent your computer from connecting to some websites and servers that are known to contain malicious content, including viruses, spyware, Trojans, web pages that engage in phishing attacks, spam, phorm, shocking or violent content, prevent annoying pop-ups, block ad servers..etc. This will reduce the bandwidth use and protect your computer from malicious softwares.\n"

function list_cat { 
while true; do
    echo -e -n "Do you wish to block \e[37m$1\e[0m [y/n] ? : "
    read yn
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
	echo -e "$help"
        read -p "Press any key to continue."
	exit
	;;

	-i|'')
	printf "\033c" 
	#Make sure only root can run our script
	if [[ "$EUID" -ne 0 ]]; then
		echo "This script must be run as root" 1>&2
		exit 1
	else 
		cp /etc/hosts{,.bak}
		out="$(mktemp)"
		printf "$description\n"

		omniture="[2o7-sites] : 2o7.net is a domain used by Adobe, Inc. (Omniture) which is an advertising company that is part of a network of sites, cookies, and other technologies used to track you, what you do and what you click on, as you go from site to site, surfing the Web. Over time, sites like 2o7.net can help make an online profile of you usually including the sites you visit, your searches, purchases, and other behavior. Your profile can then be exchanged and sold between various companies like 2o7.net as well as being sold to other advertisers and marketers."
		ivw="[IVW-sites] : European network of tracking sites"
		ad="[ad-sites] : General advertising content. Advertising can exist in a variety of forms including pictures, animations, embedded audio and video, text, or pop-up windows. Very often it employs autoplay of audio and video"
		belo="[belo-interactive-sites] : A. H. Belo Corporation is a Dallas-based media company that owns four daily newspapers and five smaller newspapers. The current corporation was formed when Belo Corporation separated its broadcasting and publishing operations into two corporations. This will block trafic comign from Belo interactive ads: local advertising (television and interactive)"
		cydoor="[cydoor-sites] : Cydoor Desktop Media is an Israeli adware company. Cydoor originally placed ads only in software programs such as Kazaa and iMesh,but has now expanded into running ads on websites as an advertising network. Because of Cydoor's highly controversial practices of running ads in software programs, Cydoor software is often considered spyware — and many Anti-Spyware and Antivirus applications will flag the software as such. "
		doubleclick="[doubleclick-sites] : A subsidiary of Google which develops and provides Internet ad serving services. Its clients include agencies, marketers (Universal McCann, AKQA etc.) and publishers who serve customers like Microsoft, General Motors, Coca-Cola, Motorola, L'Oréal, Palm, Inc., Apple Inc., Visa USA, Nike, Carlsberg among others."
		ecard="[e-card-scam-sites] : Malicious e-card. These sites send out mass quantities of spam and some distribute adware and spyware"
		extremedm="[extreme-dm-sites] : www.extreme-dm.com tracking"
		fastclick="[fastclick-sites] : Fastclick was an advertising network which was one of the most visited domains according to Alexa."
		hijack="[hijack-sites] : Nasty parasites that will uses page hijacking, clickjacking to redirect rafic to their servers"
		hitbox="[hitbox-sites] : Hitbox was a popular web counter and web analytics product created by WebSideStory, until taken over by Omniture subsequently taken over by Adobe), originally for adult entertainment websites."
		intellitxt="[intellitxt-sites] : An in-text advertisement platform developed by Vibrant Media, is an example of keyword advertising. Web page publishers insert a script into their pages which calls the IntelliTXT platform when a viewer views the page. This script then finds keywords on the page and double underlines them. When holding the mouse over the double underlined link, an advertisement associated with that word will pop up. "
		malware="[malware-sites] : Sites with known trojans, phishing, or other malware"
		phorm="[phorm-sites] : Phorm had worked with major US and British ISPs—including BT Group (formerly British Telecom), Virgin Media, and TalkTalk (at the time owned by The Carphone Warehouse)—on a behavioral targeting advertisement service to monitor browsing habits and serve relevant advertisements to the end user. Phorm say these deals would have given them access to the surfing habits of 70% of British households with broadband. The service, which uses deep packet inspection to check the content of requested web pages, has been compared to those of NebuAd and Front Porch."
		popuptraps="[popup-traps-sites] : Sites that bounce you around or won't let you leave"
		realmedia="[real-media-sites] : 24/7 Media, formerly 24/7 Real Media is a technology company headquartered in New York City specializing in Digital Marketing. It provides digital marketing solutions for publishers, advertisers and agencies globally. This will block realmedia.com's Open Ad Stream"
		redsheriff="[red-sheriff-sites] : Unlike most conventional spyware, imrworldwide.com's Red Sheriff is loaded as a Java applet embedded in a Web page you visit. Once loaded, it sends information about your Internet usage (how long the page took to load, how long you stayed, etc.) to the parent company, supposedly bypassing firewalls, cookie blockers and the like. A number of Internet Service Providers have begun including Red Sheriff on their start pages, which are programmed to load every time the user logs on to the Internet."
		shock="[shock-sites] : A shock site is a website that is intended to be offensive, disgusting and/or disturbing to its viewers, containing materials of high shock value which is also considered distasteful and crude, and is generally of a pornographic, scatological, extremely violent, insulting, painful, profane, or otherwise provocative nature."
		spyware="[spyware-sites] : Spyware and user tracking. By entering domains here, it will prevent certain companies from gathering information on your surfing habits. These servers do not necessarily serve ads"
		wikispam="[wiki-spam-sites] : WikiSpam is the wiki equivalent of e-mail and blog spam. Wiki spammers edit pages to include advertising links to their sites. Spam links appear as full URLS (e.g. http://example.com), as named links with a spam keyword, or as numbered links. Often a spammer will completely replace the legitimate content of a page with their spam, and may add many different links, with a range of URLS and keywords."
		yahooad="[yahoo-ad-sites] : Yahoo! ad-serving provide software to web sites and advertisers to serve ads, count them, choose the ads that will make the website or advertiser most money, and monitor progress of different advertising campaigns. This will remove ads and banners coming from Yahoo!"

		list_cat "$omniture" https://raw.github.com/eon01/hostFilter/master/lists/2o7-sites  $out
		list_cat "$ivw" https://raw.github.com/eon01/hostFilter/master/lists/IVW-sites  $out
		list_cat "$ad" https://raw.github.com/eon01/hostFilter/master/lists/ad-sites  $out
		list_cat "$belo" https://raw.github.com/eon01/hostFilter/master/lists/belo-interactive-sites  $out
		list_cat "$cydoor" https://raw.github.com/eon01/hostFilter/master/lists/cydoor-sites  $out
		list_cat "$doubleclick" https://raw.github.com/eon01/hostFilter/master/lists/doubleclick-sites  $out
		list_cat "$ecard" https://raw.github.com/eon01/hostFilter/master/lists/e-card-scam-sites  $out
		list_cat "$extremedm" https://raw.github.com/eon01/hostFilter/master/lists/extreme-dm-sites  $out
		list_cat "$fastclick" https://raw.github.com/eon01/hostFilter/master/lists/fastclick-sites  $out
		list_cat "$hijack" https://raw.github.com/eon01/hostFilter/master/lists/hijack-sites  $out
		list_cat "$hitbox" https://raw.github.com/eon01/hostFilter/master/lists/hitbox-sites  $out
		list_cat "$intellitxt"   https://raw.github.com/eon01/hostFilter/master/lists/intellitxt-sites  $out
		list_cat "$malware" https://raw.github.com/eon01/hostFilter/master/lists/malware-sites  $out
		list_cat "$phorm" https://raw.github.com/eon01/hostFilter/master/lists/phorm-sites  $out
		list_cat "$popuptraps" https://raw.github.com/eon01/hostFilter/master/lists/popup-traps-sites  $out
		list_cat "$realmedia" https://raw.github.com/eon01/hostFilter/master/lists/real-media-sites  $out
		list_cat "$redsheriff" https://raw.github.com/eon01/hostFilter/master/lists/red-sheriff-sites  $out
		list_cat "$shock" https://raw.github.com/eon01/hostFilter/master/lists/shock-sites  $out
		list_cat "$spyware" https://raw.github.com/eon01/hostFilter/master/lists/spyware-sites  $out
		list_cat "$wikispam" https://raw.github.com/eon01/hostFilter/master/lists/wiki-spam-sites  $out
		list_cat "$yahooad" https://raw.github.com/eon01/hostFilter/master/lists/yahoo-ad-sites  $out

		list=$(cat $out)
		printf "\n"

		read -sn 1 -p "Press any key to continue...";printf "\n"	
		if egrep -q "#<?hostFilter>" /etc/hosts;then
			sed -i '/#<hostFilter>/,/<\/hostFilter>/d' /etc/hosts 1>&2			
			echo -e "#<hostFilter>\n$list\n#</hostFilter>" >> /etc/hosts
		else 
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


