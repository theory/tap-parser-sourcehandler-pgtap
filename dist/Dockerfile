FROM alpine:latest

ADD bin/* /bin/
ADD lib/ .

RUN apk add --no-cache perl postgresql-client \
    && mv TAP $(perl -e 'print $INC[0]')

WORKDIR /repo
ENTRYPOINT ["/bin/pg_prove"]
CMD ["--help"]
