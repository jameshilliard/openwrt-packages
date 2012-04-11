#!/bin/bash

cd $1


./scripts/feeds uninstall firmwarehotplug
./scripts/feeds uninstall faad2           # Mplayer link to faad2.
./scripts/feeds uninstall libxfcegui4     # Even mark as =m, it also break the build


(cd feeds/qipackages/; \
)


(cd feeds/packages/; \
)
