#!/bin/bash
## Author: amri.aymen@gmail.com
##
## Usage: hostfilter [options] ARG1
##
## Options:
##   -h, --help    Display the help.
##   -u            Update the filter lists
#

printf "\033c"

function list_cat { 
while true; do
    read -p "Do you wish to block $1 [y/n] ? : " yn
    case $yn in
        [Yy]* )
	wget - -O $2 
	break;;
        [Nn]* ) echo "no";
	exit;;
        * ) echo "Please answer y or n.";;
    esac
done
}


#Make sure only root can run our script
if [[ "$EUID" -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
else 
	out="$(mktemp)"
	printf "This script will help you block unwanted websites.\n"

	list_cat "shock sites" https://raw.github.com/eon01/hostFilter/master/lists/shock-sites




	printf "\n"
	read -sn 1 -p "Press any key to continue...";printf "\n"







	exit 0
fi
#


