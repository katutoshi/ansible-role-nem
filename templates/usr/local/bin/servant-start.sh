#!/bin/bash
# create pid directory
[ -d ${RUN_DIR} ] || mkdir ${RUN_DIR}

# start servant
cd {{ servant_home }}/servant
java -Xms256M -Xmx256M -cp ".:jars/*" org.nem.rewards.servant.NodeRewardsServant > $LOG 2>$ERROR_LOG &
echo $! > ${PID_FILE}
