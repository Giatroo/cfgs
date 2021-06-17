#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch my bar
polybar example &

echo "Bar launched..."
