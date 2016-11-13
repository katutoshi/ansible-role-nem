#!/bin/bash
cd {{ nis_ncc_base_dir }}/{{ nem_version }}/package/ncc
java -cp ".:./*:../libs/*" org.nem.deploy.CommonStarter > $LOG 2>$ERROR_LOG &
echo $! > ${PID_FILE}
