#!/bin/bash

PGPROVE_IMAGE=${PGPROVE_IMAGE:=pg_prove/pg_prove:latest}

docker run -it --rm --network host \
    --mount "type=bind,src=$(pwd),dst=/repo" \
    --mount "type=bind,src=$HOME,dst=/root" \
    pg_prove $@
