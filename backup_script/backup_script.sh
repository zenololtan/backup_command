# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    backup_script.sh                                   :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2019/11/13 13:54:36 by ztan           #+#    #+#                 #
#    Updated: 2019/11/13 21:57:57 by ztan          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

function Dircheck()
{
	BASE=`pwd`
	if [[ "$BASE" != *"$DIRNAME"* ]]
	then
		echo "Error not in a project directory."
		echo "Please put your project file in "$DIRNAME" or move to your project directory."
		exit
	fi
}

function Prod_name()
{
	P_NAME=`basename "$(dirname "$BASE")"`
	while [ "$P_NAME" != "$DIRNAME" ]
	do
		cd ..
		P_NAME=`basename "$(dirname $(pwd))"`
	done
	P_NAME=`basename "$(basename $(pwd))"`
	SORC=`pwd`
}

function If_tar()
{
	EX="tar"
	if [ "$ARG" == "$EX" ]
	then
		tar -zvcf file.tar.gz "$SORC"
	fi
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
	if [ ! -d "$P_NAME" ]
	then
		echo "Making "$P_NAME" directory."
		mkdir "$P_NAME"
	fi
}

function Dirmakemove()
{
	echo "Making backup."
	DIR="$(date +"%Y %b_%d")"
	if [ ! -d "$DIR" ]
	then
		echo "Making "$DIR" directory."
		mkdir "$DIR"
	fi
	cd "$DIR"
	DIR="$(date +"%H_%M")"
	mkdir "$DIR"
	cd "$DIR"
}

function Backup_n_return()
{
	DEST=`pwd`
	echo "$SORC"
	if [[ "$ARG" = "$EX" ]]
	then
		mv "$SORC/file.tar.gz" "$DEST"
	else
		cp -R "$SORC"/. "$DEST"
	fi
	echo "Backup finished."
	echo "Backup path:"
	echo "$DEST"
	cd "$BASE"
}

function main()
{
	Dircheck
	Prod_name
	If_tar
	cd ~/Desktop
	Bfile_check
	cd backup
	Prod_check
	cd $P_NAME
	Dirmakemove
	Backup_n_return
}

# Customize the directory name to your projects.
# The directory name is the name of the directroy where you put your project files.
# If your projects are in the Desktop file, your directory name will be "Desktop".

# Insert your directory name here
DIRNAME="Desktop"
cd $1
ARG="$2"
main
