#!/bin/sh

killall polybar
while grep -x polybar >/dev/null; do sleep 1; done

polybar -c /$HOME/.config/i3/polybar/poly.cfg i3bar &
