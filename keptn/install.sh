#!/bin/bash

curl -sL https://get.keptn.sh | sudo -E bash

echo "{}" > creds.json

keptn install --endpoint-service-type=NodePort -c ./creds.json

