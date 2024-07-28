#!/bin/bash
# Enter the name of the Script of that you want to checkup
 SERVICE="nginx"
 if systemctl is-active --quiet $SERVICE;then
	 echo "$SERVICE IS RUNNING..."
 else
	 echo"$SERVICE IS NOT RUNNING.."
	 systemctl start $SERVICE
 fi
