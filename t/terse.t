#!/bin/bash

. ./t/libtap.sh
. ./t/fixtures.sh

plan 2

ok_program 'output of --terse' 0 \
'bar  on
baz  345
foo  off' \
$chkconfig --terse

ok_program 'output of --terse with argument' 0 \
'bar  on' \
$chkconfig --terse bar

cleanup
