#!/bin/bash 
set -e
set -o pipefail
# Restart postgres to make sure we can connect

if [[ ${AQTS_DATABASE_ADDRESS} == *"amazon"* ]]; then
  psql -h ${AQTS_DATABASE_ADDRESS} -U ${AQTS_SCHEMA_OWNER_USERNAME} -d ${AQTS_DATABASE_NAME} -c "create extension if not exists aws_s3 cascade;"
  printf 'aws_s3_extension created!'
  exit 64
else
  printf 'did not create aws_s3 extension because we are not using RDS'
  exit 125
fi

# pg_ctl -D "$PGDATA" -m fast -o "$LOCAL_ONLY" -w restart