#!/bin/bash
netstat -plant | grep 80
curl http://`hostname`:80
export NO_PROXY=localhost,169.254.169.254
result=$(/usr/bin/curl -o -I -L  -w "%{http_code}" http://`hostname`:80)

if [[ "$result" =~ "200" ]]; then
    echo "OneSearch deployment succeeded"
    exit 0
else
    echo "OneSearch deployment failed"
        exit 1
fi