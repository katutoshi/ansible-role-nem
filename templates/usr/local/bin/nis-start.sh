#!/bin/bash
[ -d $RUN_DIR ] || mkdir -p ${RUN_DIR}
cd {{ nis_ncc_base_dir }}/{{ nem_version }}/package/nis
java -Xms512M -Xmx1G -cp ".:./*:../libs/*" org.nem.deploy.CommonStarter > $LOG 2> $ERROR_LOG &
echo $! > ${PID_FILE}
