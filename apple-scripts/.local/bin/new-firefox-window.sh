#!/bin/zsh

AEROSPACE=/opt/homebrew/bin/aerospace

target_ws=$($AEROSPACE list-workspaces --focused)

# Blocks until the new window actually exists (it's a remote command to the
# already-running instance, or a real launch if Firefox wasn't running), so
# there's nothing to poll for - move-node-to-workspace can run immediately.
/Applications/Firefox.app/Contents/MacOS/firefox --new-window "about:blank"

$AEROSPACE move-node-to-workspace --focus-follows-window -- "$target_ws"
