#!/bin/bash

curl -fsSl https://static.kubevela.net/script/install.sh | sudo bash -s 1.5.3
vela install

## enable velaux by default

vela addon enable velaux