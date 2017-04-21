#!/bin/bash

OPTS="-Dcom.sun.management.jmxremote"
OPTS="$OPTS -Dcom.sun.management.jmxremote.local.only=false"
OPTS="$OPTS -Dzookeeper.root.logger=INFO,ROLLINGFILE"
OPTS="$OPTS -Dcom.sun.management.jmxremote.host=127.0.0.1"

OPTS="$OPTS -Djute.maxbuffer=262144"

CLS=org.apache.zookeeper.server.quorum.QuorumPeerMain

. /usr/bin/zkEnv.sh
ZOO_LOG4J_PROP="INFO,ROLLINGFILE"
export ZOO_LOG4J_PROP

for NUM in $@
do
  ZOOCFGDIR=$HOME/.oio/zookeeper/${NUM}
  ZOOCFG=${ZOOCFGDIR}/zoo.cfg
  ZOO_LOG_DIR=$ZOOCFGDIR/logs
  export ZOOCFG ZOOCFGDIR ZOO_LOG_DIR
  (
  mkdir -p "${ZOOCFGDIR}/data"
  echo "${NUM}" > "${ZOOCFGDIR}/data/myid"
  set -x
  nohup /usr/bin/java \
    -cp "$ZOOCFGDIR:$CLASSPATH" \
    $OPTS "-Dzookeeper.log.dir=$ZOO_LOG_DIR" \
    $CLS "$ZOOCFG" >/dev/null 2>/dev/null &
  )
done

