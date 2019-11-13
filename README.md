Author: Zeno Tan

Date: 2019 13/nov

Contact name slack: zeno tan

step 1. copy/paste the backup_script directory in your user directory. your pathname should look like this: /users/username/backup_command/backup_script

step 2. paste:

#----------------------------------------------

source ~/backup_command/backup_script/custom_command.sh

#----------------------------------------------

at the end of your ~/.bashrc or ~/.zshrc file.

or just run

echo 'source ~/backup_command/backup_script/custom_command.sh' >> ~/.zshrc

step 3. if your projects are located in another file "other then Desktop",
be sure to modify your directory name in the backup_script.sh file!!

to customize your preferences, open the "backup_script.sh" file and do your stuff..

Type "backup tar" if you want to backup in a tar file.
