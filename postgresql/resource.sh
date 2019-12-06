#!/bin/bash

ROOT_USERNAME=$USERNAME
ROOT_PASSWORD=$PASSWORD

if [ $1 eq "create" ]; then
  NEW_USERNAME=`cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
  NEW_PASSWORD=`cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
  NEW_DATABASE=`cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`

  kubectl exec -it $(kubectl get pods -o name | grep -m1 postgresql | cut -d'/' -f 2)  -- sh -c "echo 'create user $NEW_USERNAME with encrypted password '$NEW_PASSWORD'' | PGPASSWORD=$ROOT_PASSWORD psql -U $ROOT_USERNAME template1"
  kubectl exec -it $(kubectl get pods -o name | grep -m1 postgresql | cut -d'/' -f 2)  -- sh -c "echo 'create database $NEW_DATABASE' | PGPASSWORD=$ROOT_PASSWORD psql -U $ROOT_USERNAME template1"
  kubectl exec -it $(kubectl get pods -o name | grep -m1 postgresql | cut -d'/' -f 2)  -- sh -c "echo 'grant all privileges on database $NEW_DATABASE to $NEW_USERNAME' | PGPASSWORD=$ROOT_PASSWORD psql -U $ROOT_USERNAME template1"

  echo "psql://$NEW_USERNAME:$NEW_PASSWORD/$NEW_DATABASE"
elif [ $1 eq "destroy" ]; then
  EXISTING_USERNAME=`echo "$2"  | sed 's/.*\/\/\(.*\):.*/\1/'`
  EXISTING_DATABASE=`echo "$2"  | sed 's/.*\/\([^/]*\)/\1/'

  kubectl exec -it $(kubectl get pods -o name | grep -m1 postgresql | cut -d'/' -f 2)  -- sh -c "PGPASSWORD=$ROOT_PASSWORD dropdb -U $ROOT_USERNAME $EXISTING_DATABASE"
  kubectl exec -it $(kubectl get pods -o name | grep -m1 postgresql | cut -d'/' -f 2)  -- sh -c "PGPASSWORD=$ROOT_PASSWORD dropuser -U $ROOT_USERNAME $EXISTING_USERNAME"
fi
