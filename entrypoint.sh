#!/bin/bash
service filebeat start
$GATLING_HOME/bin/gatling.sh
