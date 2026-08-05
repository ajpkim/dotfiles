#!/usr/bin/osascript

try
    set currentWorkspace to do shell script "/opt/homebrew/bin/aerospace list-workspaces --focused"

    if not (application id "com.googlecode.iterm2" is running) then
        tell application id "com.googlecode.iterm2" to activate
        delay 1
    end if

    tell application id "com.googlecode.iterm2"
        create window with default profile command "emacsclient -nw"
        activate
    end tell

    delay 0.3
    do shell script "/opt/homebrew/bin/aerospace move-node-to-workspace --focus-follows-window -- " & quoted form of currentWorkspace
end try
