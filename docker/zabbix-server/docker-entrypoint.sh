#/bin/bash

trap 'service zabbix-server stop' EXIT

service zabbix-server start

tail -f /dev/null
