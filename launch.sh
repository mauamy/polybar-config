#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# set MONITOR variable
MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main &
#polybar mainHDMI &
