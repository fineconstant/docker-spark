#!/usr/bin/env bash

if [ -n ${SPARK_NODE_ROLE} ]; then
    echo "Node role: $SPARK_NODE_ROLE"
    if [ "$SPARK_NODE_ROLE" = "master" ]; then
        bash ${SPARK_HOME}/sbin/start-master.sh
    elif [ "$SPARK_NODE_ROLE" = "slave" ] && [ -n ${SPARK_MASTER_URL} ]; then
        echo "Spark master URL: $SPARK_MASTER_URL"
        echo "${SPARK_HOME}/sbin/start-slave.sh ${SPARK_MASTER_URL}"
        bash ${SPARK_HOME}/sbin/start-slave.sh ${SPARK_MASTER_URL}
    else echo "Invalid slave configuration"; exit 1
    fi
else echo "Invalid node role configuration"; exit 1
fi
