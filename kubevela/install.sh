#!/bin/bash

curl -fsSl https://kubevela.io/script/install.sh | sudo bash -s 1.9.5
vela install

## enable velaux by default

vela addon enable velaux
