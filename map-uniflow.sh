#!/bin/sh

## Jamf Policy Parameters
jssUser=$4
jssPass=$5
jssHost=$6
uniFLOWurl=$7

## Load Mac Serial Number
serial=$(ioreg -rd1 -c IOPlatformExpertDevice | awk -F'"' '/IOPlatformSerialNumber/{print $4}')

## Use Jamf Pro API to get assigned username
username=$(/usr/bin/curl -H "Accept: text/xml" -sfku "${jssUser}:${jssPass}" "${jssHost}/JSSResource/computers/serialnumber/${serial}/subset/location" | xmllint --format - 2>/dev/null | awk -F'>|<' '/<username>/{print $3}')

## If either the username came back blank from the above API calls, exit
if [[ "$username" == "" ]]; then
    echo "Error - Username blank"
    exit 1
## Map UniFlow Secure and Delegated queues
else
    /usr/sbin/lpadmin -p "SecurePrint" -E -v lpd://$userName@$uniFLOWurl/SecurePrint -P /etc/cups/ppd/SecurePrint.ppd -o printer-is-shared="False" -o "ColorModel=Gray" -D "SecurePrint"
    /usr/sbin/lpadmin -p "DelegatedPrint" -E -v lpd://$userName@$uniFLOWurl/DelegatedPrint -P /etc/cups/ppd/DelegatedPrint.ppd -o printer-is-shared="False" -o "ColorModel=Gray" -D "DelegatedPrint" 
fi
