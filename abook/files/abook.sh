#!/bin/sh
/usr/sbin/setfont2 /usr/share/setfont2/un-fuzzy-4x8-font.pnm
/usr/bin/abook.bin -C /etc/abookrc $*
/usr/sbin/setfont2 /usr/share/setfont2/un-fuzzy-6x10-font.pnm
