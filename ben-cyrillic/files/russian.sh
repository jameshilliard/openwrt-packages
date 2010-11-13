#!/bin/sh
setfont2 /usr/share/ben-cyrillic/un-fuzzy-6x10-font_rus.pnm
loadkeys /usr/share/ben-cyrillic/ben_ru_uni.map
loadunimap /usr/share/ben-cyrillic/ben_ru_uni.trans
profile="/etc/profile"
locale="export LC_ALL=ru_RU.UTF-8"
grep "$locale" "$profile" > /dev/null 2>&1
if [ "$?" -eq "1" ]; then
	#presumably first run, need to set the LC_ALL env
	echo "$locale" >> "$profile"
fi
