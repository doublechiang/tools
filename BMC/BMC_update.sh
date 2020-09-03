#!/bin/bash
# Quanta Copyright 2019, version 1.0
#BMC_Update.sh <BMC IP> <Username> <Password> <Image>


function request() {
	verb=$1; shift
	url=$1; shift
	session=$1; shift
	csrf=$1; shift
	extra=$@

	RES=`curl -L -s -k --request $verb \
			--url "$url" \
			--header "$session" \
			--header "X-CSRFTOKEN: $csrf" \
			--header "Cache-Control: no-cache" \
			--header "Accept-Encoding: gzip, deflate" \
			--header "Accept-Language: en-US,zh-TW;q=0.8,zh;q=0.5,en;q=0.3" \
			--header 'Accept: application/json, text/javascript, */*; q=0.01' \
			--header "Connection: keep-alive" \
			--header "X-Requested-With: XMLHttpRequest" \
			"$@"`
	echo $RES
}

# command -v jq > /dev/null 2>&1 || { echo "jq utility is required"; exit 1; }
command -v curl > /dev/null 2>&1 || { echo "curl utility is required"; exit 1; }
set -e


if [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ] && [ -n "$4" ]
then

	BMC_IP=$1
	username=$2
	password=$3
	IMAGE=$4

	#step 1, create session
	echo -e "\n##### Create Session"
	OUTPUT=`curl -i -L -s -k --request POST \
	  --url "https://$BMC_IP/api/session" \
	  --header 'Cache-Control: no-cache' \
	  --header 'Content-Type: application/x-www-form-urlencoded' \
	  --header 'postman-token: a5bee417-5686-53d2-6476-1128149281c4' \
	  --data "password=$password&username=$username"`

	#SESSION_HEADER=`${GREP} -Po "Cookie: QSESSIONID=\w{30}" tmp.json`
	SESSION_HEADER=`echo $OUTPUT | grep -o "Cookie: QSESSIONID=[0-9a-zA-Z]*"`
	#CSRFTOKEN=`echo $OUTPUT | tail -1 | jq -R .'CSRFToken'`
    #SESSION_RESULT=`cat tmp.json`
	SESSION_RESULT=`echo $OUTPUT`
    CSRFTOKEN=${OUTPUT#*CSRFToken\": \"}
    CSRFTOKEN=${CSRFTOKEN%\"*}

	echo "Login Session Info: ${SESSION_HEADER}"
	echo "Token: $CSRFTOKEN"


	#step 2, mount shared memory
	echo -e "\n##### mount shared memory"
	RES=`request "PUT" "https://$BMC_IP/api/maintenance/flash" "${SESSION_HEADER}" $CSRFTOKEN \
		--header 'Content-Type: application/json;'`

	#step 3, Upload BMC image
	echo -e "\n##### Upload BMC image"
	RES=`request "POST" "https://$BMC_IP/api/maintenance/firmware" "${SESSION_HEADER}" $CSRFTOKEN -F "fwimage=@$IMAGE"`

	#step 4, Verification BMC image
	echo -e "\n##### Verification BMC image"
	RES=`request "GET" "https://$BMC_IP/api/maintenance/firmware/verification" "${SESSION_HEADER}" $CSRFTOKEN`

	#step 5, Upgrade BMC
	echo -e "\n##### Upgrade BMC"
	RES=`request "PUT" "https://$BMC_IP/api/maintenance/firmware/upgrade" "${SESSION_HEADER}" $CSRFTOKEN \
		--header 'Content-Type: application/json;' \
		--data '{"preserve_config":0,"flash_status":1}'`

	# Get Progress.
	for i in {1..90}
	do
		RES=`request "GET" "https://$BMC_IP/api/maintenance/firmware/flash-progress" "${SESSION_HEADER}" $CSRFTOKEN`
#		percent=`echo $RES | jq -r '."progress"'`
		percent=`echo $RES | awk -F, '{print $3}' | awk -F: '{print $2}' | sed 's/"//g'`
		echo -e "Percentage: $percent"
		if [[ "$percent" == *"Completed"* ]]; then
			#step 6, Reset BMC after flashing done
			echo -e "\n##### Reset BMC after flashing done";
			RES=`request "POST" "https://$BMC_IP/api/maintenance/reset" "${SESSION_HEADER}" $CSRFTOKEN \
				--header 'Content-Type: application/json;' \
				--header 'Content-Length: 0'`
			exit 0
		fi
		sleep 10
	done
	# Timeout
	echo -e "Flash Timeout Error";
	exit 1;

else
	echo "Usage: BMC_update_test.sh <BMC IP> <Username> <Password> <imgfile>"; exit 1
fi
