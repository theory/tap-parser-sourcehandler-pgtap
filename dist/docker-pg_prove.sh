#!/bin/bash

PGPROVE_IMAGE=${PGPROVE_IMAGE:=itheory/pg_prove:latest}

passenv=()

for var in \
    PGUSER PGPASSWORD PGHOST PGHOSTADDR PGPORT PGDATABASE PGSERVICE \
    PGOPTIONS PGSSLMODE PGREQUIRESSL PGSSLCOMPRESSION PGREQUIREPEER \
    PGKRBSRVNAME PGKRBSRVNAME PGGSSLIB PGCONNECT_TIMEOUT PGCLIENTENCODING \
    PGTARGETSESSIONATTRS
do
    if [ ! -z "${!var}" ]; then
       passenv+=("-e" "$var=${!var}")
    fi
done

docker run -it --rm --network host \
    --mount "type=bind,src=$(pwd),dst=/repo" \
    --mount "type=bind,src=$HOME,dst=/root" \
    "${passenv[@]}" "$PGPROVE_IMAGE"  $@
