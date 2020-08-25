#!/bin/bash
USERNAME="admin"
PASSWORD="cmn9.admin"
NEW_USERNAME="root"
NEW_PASSWORD="root"

######### Clear customer id in MB FRU #########
echo -e "\nPlease input your BMC IP address"
read -p "BMC IP address: " BMC_IP

##### Add new User and Password #####

LOG=./Change.log

disable_def_account()
{
  echo "Disabling default account..."
  ipmitool -H $BMC_IP -U $NEW_USERNAME -P $NEW_PASSWORD user disable 2 | tee -a $LOG
  sleep 1s

  echo "Check default account access"
  RESPONSE=`ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD sdr |grep -i "Temp" |wc -l`
  if [ $RESPONSE == 0 ]; then
      echo "No BMC connection using default credentials (disabled)!"
      exit 0
  else
      echo "Default credentials not disabled - check logs for appropriate actions!"
      exit 1
  fi

}

#if [ -z $1 ]; then
#    echo "Usage: $0 <bmc_ip>"
#    exit 1
#fi
#BMC_IP=$1
RESPONSE=`ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD sdr |grep -i "Temp" |wc -l`
if [ $RESPONSE == 0 ]; then
    echo "No BMC connection using default credentials - aborted!"
    exit 1
fi

echo "Current user list"
ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD user list 1 | tee -a $LOG

echo "Create new administrator account"
USERID=`ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD user list 1 | tail -n 1 |awk '{print $1}'`
#NEW_USERID=$((USERID+1))
NEW_USERID=3
echo "New userID = $NEW_USERID"
sleep 1s
ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD user set name $NEW_USERID $NEW_USERNAME | tee -a $LOG
ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD user set password $NEW_USERID $NEW_PASSWORD | tee -a $LOG
ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD user enable $NEW_USERID | tee -a $LOG
ipmitool -H $BMC_IP -U $USERNAME -P $PASSWORD channel setaccess 1 $NEW_USERID callin=on ipmi=on link=off privilege=4 | tee -a $LOG
ipmitool -I lanplus -H $BMC_IP -U $USERNAME -P $PASSWORD sol payload enable 1 $NEW_USERID | tee -a $LOG

echo "Updated user list using the new credentials"
ipmitool -H $BMC_IP -U $NEW_USERNAME -P $NEW_PASSWORD user list 1 | tee -a $LOG
sleep 1s

#disable_def_account
