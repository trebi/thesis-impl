#!/bin/sh
until psql -U $POSTGRES_USER -c '\l'; do
    echo >&2 "$(date +%Y%m%dt%H%M%S) Postgres is unavailable - sleeping"
    sleep 1
done;
psql -U $POSTGRES_USER -c "create database ${POSTGRES_DATABASE}";
psql -U $POSTGRES_USER $POSTGRES_DATABASE < schema.sql;