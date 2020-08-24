#!/bin/bash

ip=$1
username=$2
password=$3

url=https://$ip/redfish/v1/Chassis/Self

result=`curl -L -s -k -u $username:$password --request GET \
			--url "$url" --header 'Content-type:Application/json'`
echo $result



