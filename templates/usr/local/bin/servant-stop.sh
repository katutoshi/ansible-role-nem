#!/bin/bash
[ -f ${PID_FILE} ] && kill -9 $(cat ${PID_FILE})
[ -f ${PID_FILE} ] && rm ${PID_FILE}
