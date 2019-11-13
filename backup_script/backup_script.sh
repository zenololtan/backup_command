# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    backup_script.sh                                   :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2019/11/13 13:54:36 by ztan           #+#    #+#                 #
#    Updated: 2019/11/13 17:58:51 by ztan          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

function Dircheck()
{
	string=`pwd`
	if [[ $string != *$DIRNAME* ]]
	then
		echo "Error not in a project directory."
		echo "Please put your project file in $DIRNAME or move to your project directory."
		exit
	fi
}

function Prod_name()
{
	BASE=`pwd`
	P_NAME=`basename "$(dirname "$BASE")"`
	while [ "$P_NAME" != $DIRNAME ]
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
	echo "Backup finished."
	echo "Backup path:"
	echo $DEST
	cd $BASE
}

function main()
{
	Dircheck
	Prod_name
	cd ~/Desktop
	Bfile_check
	cd backup
	Prod_check
	cd $P_NAME
	backup_n_return
}

# Customize the directory name to your projects.
# The directory name is the name of the directroy where you put your project files.
# If your projects are in the Desktop file, your directory name will be "Desktop".
# DO NOT INSERT PATH NAME, ONLY INSERT THE NAME OF THE DIRECTORY WHERE YOUR PROJECTS ARE LOCATED.

# Insert your directory name here
DIRNAME="Desktop"
cd $1
main
