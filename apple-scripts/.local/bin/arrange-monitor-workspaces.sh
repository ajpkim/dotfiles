#!/bin/zsh

# Lays workspace N onto monitor N for every connected monitor (main = 1),
# then ends with monitor 1 / workspace 1 focused. Monitor count/order comes
# from `aerospace list-monitors`, so this adapts to however many displays
# are plugged in - no hardcoded monitor count or names.
#
# Plain `workspace <n>` won't do this: it jumps focus to wherever that
# workspace is already assigned (main, by default) rather than moving it to
# the focused monitor. `move-workspace-to-monitor --workspace <n> -- <m>`
# is the command that actually relocates it.

AEROSPACE=/opt/homebrew/bin/aerospace

count=$($AEROSPACE list-monitors --count)

for i in $(seq 1 "$count"); do
    $AEROSPACE move-workspace-to-monitor --workspace "$i" -- "$i"
done

$AEROSPACE focus-monitor 1
$AEROSPACE workspace 1 --fail-if-noop 2>/dev/null
exit 0
