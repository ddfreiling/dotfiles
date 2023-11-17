#!/bin/bash
# Created from snippets at:
# https://community.jamf.com/t5/jamf-pro/a-reliable-fix-for-filevault-2-password-sync-issue/m-p/234241

set -e

# Get the current user details
currentUser=$(who | awk '/console/{print $1}')

# Get the user UUID number
userNameUUID=$(dscl . -read /Users/$currentUser/ GeneratedUID | awk '{print $2}')

echo "Current user $currentUser has UUID $userNameUUID";

# Get the user's Old password
oldPass="$(osascript -e 'Tell application "System Events" to display dialog "Please enter your Old login password:" default answer "" with title "Login Password" with text buttons {"Ok"} default button 1 with hidden answer' -e 'text returned of result')"

# Get the user's New password
newPass="$(osascript -e 'Tell application "System Events" to display dialog "Please enter your New login password:" default answer "" with title "Login Password" with text buttons {"Ok"} default button 1 with hidden answer' -e 'text returned of result')"

# Get diskname for 'Macintosh HD'
diskName=$(diskutil list | grep -e 'Macintosh HD' | head -1 | awk {'{print $NF}'})

# Synchronize disk's FileVault password
diskutil apfs changePassphrase $diskName -user $userNameUUID -oldPassphrase $oldPass -newPassphrase $newPass
