#!/usr/bin/env sh
export NAMES
NAMES=$(find /data/images/*.png | sed 's@.*/@@g' | sed 's@.png@@g')
for i in ${NAMES}; do /root/util-say/ponytool --import image --magnified 1 --file "/data/images/${i}.png" --balloon n --export ponysay --chroma 1 --platform xterm --right 5 > "/root/util-say/tmp/${i}-image.txt"; done
for i in ${NAMES}; do figlet "${i//-/ }" > /root/util-say/tmp/"${i}"-name.txt; cat /data/host-data.txt >> /root/util-say/tmp/"${i}"-name.txt; done
for i in ${NAMES}; do paste /root/util-say/tmp/"${i}"-image.txt /root/util-say/tmp/"${i}"-name.txt > /data/dist/templates/"${i}".motd; done