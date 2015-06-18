#!/bin/bash

## ENV Variables

apt-get update
apt-get install ansible unzip -y
[[ -f /tmp/serf.zip ]] || wget https://dl.bintray.com/mitchellh/serf/0.6.4_linux_amd64.zip -O /tmp/serf.zip
[[ -d /usr/local/bin  ]] || mkdir -p /usr/local/bin/
[[ -f /usr/local/bin/serf ]] || unzip  /tmp/serf.zip -d /usr/local/bin
grep serf /etc/rc.local || echo  "/usr/local/bin/serf agent --discover myserf-cluster &" > /etc/rc.local ## Refactor this so it doesn't smash the existing rc.local
killall serf
/etc/rc.local





