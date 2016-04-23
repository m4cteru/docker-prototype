#!/bin/bash

service td-agent start

trap 'service td-agent stop; exit 0' EXIT

tail -f /dev/null
