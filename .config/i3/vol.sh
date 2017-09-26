#!/bin/bash
out1="alsa_output.pci-0000_00_1f.3.analog-stereo"
out2="bluez_sink.35_CD_2D_E4_D6_26"

current="$(pacmd list-sinks | grep -A 1 -e '*' | grep -oE '<(.*)>' | sed 's,.\(.*\).$,\1,g')"

pactl set-sink-mute @DEFAULT_SINK@ true
if [ "$current" == "$out1" ] ; then
	pacmd set-default-sink $out2
else
	echo "nonequal"
	pacmd set-default-sink $out1
fi
pactl set-sink-mute @DEFAULT_SINK@ false
