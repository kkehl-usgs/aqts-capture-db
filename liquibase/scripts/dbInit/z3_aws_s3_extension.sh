#!/bin/bash
set -e
set -o pipefail

psql -h ${AQTS_DATABASE_ADDRESS} -U ${AQTS_SCHEMA_OWNER_USERNAME} -d ${AQTS_DATABASE_NAME} -c "create extension if not exists aws_s3 cascade;"