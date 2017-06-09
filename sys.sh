#!/bin/bash

echo "*********************************"

echo "NAHO MASLENGARTI 15A087FS L3AR"

echo "*********************************"

echo "********************************"
echo "* Bienvenue Sur mon Projet Sys *" 
echo "********************************"


while :
do

echo "a-Afficher les Information des Utilisateurs Enregistres il ya trois jours"
echo "b-Acquerir, installer et lancer XAMPP"
echo "c-Archiver des elements du repertoire personnel modifies par le user Sodoer il ya deux jours"
echo "d-Afficher les informations sur l'utilisation du disque,du processeur et de la swap "
echo "e-Quitter"


read -p "Que voulez-vous faire?" resp
case $pesp in 
	#liste de tout les utilisateurs
	'a') cut -d : -f 1 /etc/passwd
	
	#liste des repertoires se trouvant dans /home 
	ls /home>user_foders
	
	while read line 
	do
		while read line1
		do	
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<user_foders
	done<all_users
	find /home/* -type d -ctime 3 -print

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then
		echo " $user a ete cree il ya 3jour"
	      fi

	  done<user1 
	done<userx
	cat 3days_users.txt
 ;;
	'b') echo "tellechagement  de xampp"
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	 echo " insatllation "
	 ./xampp-linux-x64-5.6.30-1-installer.run
	
	 sudo su
	#arret du service apache 
	service apache2 stop
	#arret du service ftp
	service proftpd stop
	#demarage de xampp
	/opt/lampp/lampp start
;;
	'c') echo "archivage"
	#archivage des fichier du rep home modifier par le sudoer il ya 2 jours
	mkdir -p /home/ushi-deshi/archive
	find /home/ushi-deshi/ -type f -mtime 2 -print>/home/ushi-deshi/ficmodi
	while read line
	do
	cp $line archive
	done </home/ushi-deshi/ficmodi
	tar -czvf archive.tar.gz archive
	#mv archive.tar.gz /media/usb/*/archive.tar.gz
	mv archive.tar.gz /home/ushi-deshi/prof/archive.tar.gz
	;;
	'd') echo "les informations sur l'utilisation du disque :"
		df -h |gre /dev/sd
		echo "les informations sur l'utilisation de la memoire et de la swap :"
		free -h 
;;
	e )  exit;;
        *) echo  "$resp ne corespond a aucun choix"
esac
done

