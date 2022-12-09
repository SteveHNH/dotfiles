#!/usr/bin/env bash
#
polybar-msg cmd quit

# Launch bar
echo "---" | tee -a /tmp/mybar.log
polybar mybar 2>&1 | tee -a /tmp/mybar.log & disown

echo "Bar launched"
