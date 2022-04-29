#!/bin/bash
mkdir -p "/Library/Application Support/OpenDNS Roaming Client/"
DATA='<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>APIFingerprint</key>
<string>**ADD ORG FINGERPRINT**</string>
<key>APIOrganizationID</key>
<string>** ADD ORG ID**)</string>
<key>APIUserID</key>
<string>** ADD ORG USER ID**</string>
<key>InstallMenubar</key>
<true/>
</dict>
</plist>'
echo "$DATA" > "/Library/Application Support/OpenDNS Roaming Client/OrgInfo.plist"
