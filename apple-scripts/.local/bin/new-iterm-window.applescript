#!/usr/bin/osascript

try
    set currentWorkspace to do shell script "/opt/homebrew/bin/aerospace list-workspaces --focused"

    if application id "com.googlecode.iterm2" is running then
        tell application id "com.googlecode.iterm2"
            create window with default profile
            activate
        end tell
    else
        tell application id "com.googlecode.iterm2" to activate
    end if

    delay 0.3
    do shell script "/opt/homebrew/bin/aerospace move-node-to-workspace --focus-follows-window -- " & quoted form of currentWorkspace
end try
