#!/bin/bash

cd $1

FEEDS_CONF="feeds.conf.default"
test -f "feeds.conf" && FEEDS_CONF="feeds.conf"

feeds="$(cat "${FEEDS_CONF}" | grep -v -E "^#")"

echo "# base :: openwrt [scm-protocol] [source] [branch] [revision]"
repo=$(git config -l | grep remote.origin.url | cut -d "=" -f 2)
rev=$(git log | head -n 1 | cut -b8-)
branch=$(git branch | grep "*" | cut -b3-)
echo "openwrt git ${repo} ${branch} ${rev}"

echo "# feeds :: [feedname] [scm-protocol] [revision]"
IFS=$'\n'
for feed in $feeds; do
        IFS=' ' arr=(${feed:4})
        proto=${arr[0]}
        dir=${arr[1]}

        if [ "$proto" = "svn" ]; then
                cd feeds/${dir} && rev=`svn info | grep -E "^Revision" | cut -d " " -f2` && cd ../../
        fi
        if [ "$proto" = "git" ]; then
                cd feeds/${dir} && rev=`git  log | head -n 1 | cut -d " " -f2` && cd ../../
        fi
        if [ "$proto" = "link" ]; then
                rev=`date "+%Y-%m-%d"`
        fi

        echo "${dir} ${proto} ${rev}"
done