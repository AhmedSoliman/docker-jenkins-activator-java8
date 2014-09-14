#!/bin/bash

# Start the jenkins Swam Slave
JAR=`ls -1 swarm-client-*.jar | head -n 1`

PARAMS=""
if [ ! -z "$JENKINS_USERNAME" ]; then
    PARAMS="$PARAMS -username '$JENKINS_USERNAME'"
fi
if [ ! -z "$JENKINS_PASSWORD" ]; then
    PARAMS="$PARAMS -password '$JENKINS_PASSWORD'"
fi
if [ ! -z "$JENKINS_MASTER" ]; then
    PARAMS="$PARAMS -master '$JENKINS_MASTER'"
else
    echo "You must specify JENKINS_MASTER=http(s)://your.jenkins.host"
    exit 1
fi
if [ ! -z "$SLAVE_NAME" ]; then
    PARAMS="$PARAMS -name '$SLAVE_NAME'"
fi
if [ ! -z "$SLAVE_EXECUTORS" ]; then
    PARAMS="$PARAMS -executors '$SLAVE_EXECUTORS'"
fi
if [ ! -z "$SLAVE_LABELS" ]; then
    PARAMS="$PARAMS -labels '$SLAVE_LABELS'"
fi
if [ ! -z "$SLAVE_MODE" ]; then
    PARAMS="$PARAMS -mode '$SLAVE_MODE'"
fi



#java -jar $JAR $PARAMS -fsroot $HOME

if [ ! -z "$SSL_HOST" ]; then
  echo 1 | java InstallCert "$SSL_HOST"
  cp jssecacerts /usr/lib/jvm/java-8-oracle/jre/lib/security/
  mv jssecacerts ~/.keystore
fi

echo "Starting Jenkins Slave"

echo java -jar $JAR $PARAMS -fsroot $HOME | /bin/bash
