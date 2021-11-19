#!/bin/bash

function goto
{
    label=$1
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

goto "menu"

: menu

echo "Build THE ISO v1.0"
echo ""
echo "Please select a option."
echo ""
echo "1: Build ISO" 
echo "2: Build Calamares (Adding soon. Currently does nothing.)"
echo "3: Exit"

read input

if [ $input == "1" ] ;
then
	clear
	echo "You have inputted one. This is the build iso option."
	echo "Jumping to \"Build ISO\"."
	goto "build"
elif [ $input == "2" ] ;
then
	clear
	echo "Option is currently under construction."
	echo "Returning to main menu."
	goto "menu"
elif [ $input == "3" ] ;
then
	clear
	echo "Exitting."
	exit
else
	clear
	echo "The command that was inputted doesn't exist."
	echo "Returning to main menu."
	goto "menu"
fi

: build

cd ..
sudo mkarchiso -v -w //archiso -o /archiso archiso/
echo "Built ISO."
echo "Going back to menu."
goto "menu"


