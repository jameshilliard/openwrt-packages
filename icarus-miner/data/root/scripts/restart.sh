#!/bin/sh

WORKER=http://xiangfu.z@gmail.com_1:1234@pit.deepbit.net:8332/

ps ax | grep "python.*miner.py" | grep -v grep | sed 's/^ *//' | cut -d ' ' -f 1 | xargs kill -15

ICARUS_MINING_PATH="../queue_ver"
(cd ${ICARUS_MINING_PATH} && ./miner.py -u "${WORKER}" -s /dev/ttyUSB0 > /dev/null 2>&1 &)
