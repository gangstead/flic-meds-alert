#!/bin/bash
source ~/Library/Application\ Scripts/com.shortcutlabs.FlicMac/flic-meds-alert/config.sh
sendmail -f $FROM -it <<END_MESSAGE
To: $TO
Subject: Ivy Got Meds

Ivy Got Meds at $(date)

-- Flic button
END_MESSAGE