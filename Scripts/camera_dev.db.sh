#! /bin/bash

IP=$(minikube ip)
psql -U postgres -p 30432 -h $IP -f '/home/nick/Scripts/terminate-cameras-connections.sql';
psql -U postgres -p 30432 -h $IP -c 'drop database cameras_dev';
if (( 0 == $? )); then
	echo "we sucessfully dropped the DB."
else
	echo "Database wasn't dropped!"
fi
psql -U postgres -p 30432 -h $IP -c 'create database cameras_dev';
cd "/home/nick/panono/code/cmd/cameras/db"
psql -h $(minikube ip) -p 30432 -U postgres cameras_dev < cameras.db.sql &>/dev/null
cameras=$(psql -t -U postgres -p 30432 -h $IP cameras_dev -c 'select count(*) from cameras')
if (( 5775 == $cameras)); then
	echo "Everything seemed to have worked."
else
	echo "Camera count was wrong! camera count = $cameras"
fi
