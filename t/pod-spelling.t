#!/usr/bin/env perl -w

use strict;
use Test::More;
eval "use Test::Spelling";
plan skip_all => "Test::Spelling required for testing POD spelling" if $@;

add_stopwords(<DATA>);
all_pod_files_spelling_ok();

__DATA__
pgTAP
TCP
username
VMS
psql
POSIX
TODO
todos
xUnit
pgsql
PostgreSQL
Metadata
SQL
CPAN
Kineticode
schemas
GitHub
