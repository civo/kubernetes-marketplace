#!/bin/bash

wget https://github.com/alexellis/arkade/releases/download/0.4.0/arkade
chmod +x ./arkade

./arkade install openfaas \
  --basic-auth-password "$GATEWAY_PASSWORD"
