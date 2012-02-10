#!/bin/sh

API_KEY=http://deepbit.net/api/4edf2d91069172fdae000000_DE38384EE2
WORKER=http://xiangfu.z@gmail.com_1:1234@pit.deepbit.net:8332/

################################################

SCRIPT_PATH=`pwd`

${SCRIPT_PATH}/icarus_undermanager.py -a ${API_KEY} > ${SCRIPT_PATH}/u.log 2>&1
date >> ${SCRIPT_PATH}/u.log

TRUE_COUNT=`less ${SCRIPT_PATH}/u.log | grep "\"alive\": true"   | wc -l`
HASHRATE=`less ${SCRIPT_PATH}/u.log | grep "\"hashrate\": 0,"  | wc -l`

if [ "${TRUE_COUNT}" == "0" ] || [ "${HASHRATE}" == "1" ]; then
    echo `date`  >> ${SCRIPT_PATH}/restart.log

    ps ax | grep "python.*miner.py" | grep -v grep | sed 's/^ *//' | cut -d ' ' -f 1 | xargs kill -15

    ICARUS_MINING_PATH="../queue_ver"
    (cd ${ICARUS_MINING_PATH} && ./miner.py -u "${WORKER}" -s /dev/ttyUSB0 > /dev/null 2>&1 &)
fi
