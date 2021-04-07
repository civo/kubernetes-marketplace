#!/bin/bash
helm --namespace netdata delete netdata
kubectl delete namespace netdata

