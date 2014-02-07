#!/bin/bash

. ./t/libtap.sh
. ./t/fixtures.sh

plan 8

ok_program '--set on' 0 '' \
$chkconfig --set foo on

ok_program 'verify' 0 \
'foo  on' \
$chkconfig --terse foo

ok_program 'verify start symlink' 0 '' test -L etc/rc2.d/S??foo

ok_program '--set with explict levels' 0 '' \
$chkconfig --set baz 45

skip TODO
#ok_program 'verify' 0 \
#'baz  45' \
#$chkconfig --terse baz

ok_program '--set off' 0 '' \
$chkconfig --set foo off

ok_program 'verify' 0 \
'foo  off' \
$chkconfig --terse foo

ok_program '# todo (bug# 569162) verify kill symlink' 0 '' test -L etc/rc2.d/K??foo

cleanup

