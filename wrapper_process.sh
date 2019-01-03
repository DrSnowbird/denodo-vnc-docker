#!/bin/bash -x

set -e
set -i

WAIT_SEC=60

# /home/developer/denodo-platform-7.0/bin/denodo_platform.sh

/home/developer/denodo-platform-7.0/bin/denodo_platform.sh

sleep ${WAIT_SEC}

PID=`ps -elf|grep -i denodo|grep -i grep |awk '{print $4}' | head -1`

while [ "${PID}" != "" ]
do
    echo "Process: $PID is still running"
    sleep ${WAIT_SEC}
    PID=`ps -elf|grep -i denodo|grep -i grep |awk '{print $4}' | head -1`
done
#wait ${PID}
