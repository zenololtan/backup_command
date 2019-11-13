# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    backup_script.sh                                   :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2019/11/13 13:54:36 by ztan           #+#    #+#                 #
#    Updated: 2019/11/13 14:20:31 by ztan          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

function Dircheck()
{
	string=`pwd`
	if [[ $string != *"Desktop"* ]]
	then
		echo "Error not in a project directory."
		echo "Please put your project file in desktop."
		exit
	fi
}

function Prod_name()
{
	BASE=`pwd`
	P_NAME=`basename "$(dirname "$BASE")"`
	while [ "$P_NAME" != "Desktop" ]
	do
		cd ..
		P_NAME=`basename "$(dirname $(pwd))"`
	done
	P_NAME=`basename "$(basename $(pwd))"`
	SORC=`pwd`
}

function Bfile_check()
{
	if [ ! -d "backup" ]
	then
		echo "Making a backup directory in Desktop."
		mkdir backup
	fi
}

function Prod_check()
{
	if [ ! -d $P_NAME ]
	then
		echo "Making $P_NAME directory."
		mkdir $P_NAME
	fi
}

function backup_n_return()
{
	echo "Making backup."
	DIR="$(date +"%Y-%b\%d-%H_%M")"
	mkdir $DIR
	cd $DIR
	DEST=`pwd`
	cp -a $SORC $DEST
	cd $BASE
}

function main()
{
	Dircheck
	Prod_name
	cd /Users/ztan/Desktop
	Bfile_check
	cd backup
	Prod_check
	cd $P_NAME
	backup_n_return
}

cd $1
main
