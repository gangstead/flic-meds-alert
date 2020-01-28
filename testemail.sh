#!/bin/bash
# nested scripts run releative to the root path
source ~/Library/Application\ Scripts/com.shortcutlabs.FlicMac/flic-meds-alert/config.sh
sendmail -f $FROM -it <<END_MESSAGE
To: $TO_TEST
Subject: FlicIt test email $(date +"%T")
Test email was sent at $(date) 

by Flic mac app
END_MESSAGE

# Can also do in one line:
# printf "To:$TO_TEST\nSubject: FlicMail $(date +"%T") 2\nTest email was sent at $(date)" | sendmail -t -f $FROM