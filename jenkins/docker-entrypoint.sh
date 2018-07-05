#!/bin/sh
chown -R jenkins:jenkins $JENKINS_HOME

exec gosu jenkins "$@"
