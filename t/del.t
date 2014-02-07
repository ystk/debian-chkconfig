#!/bin/bash

. ./t/libtap.sh
. ./t/fixtures.sh

plan 1

ok_program '--del' 0 \
'foo                       0:off  1:off  2:off  3:off  4:off  5:off  6:off' \
$chkconfig --del foo

cleanup
