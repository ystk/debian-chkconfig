#!/bin/bash

. ./t/libtap.sh
. ./t/fixtures.sh

plan 3

ok_program 'output of --list' 0 \
'bar                       0:off  1:off  2:on   3:on   4:on   5:on   6:off
baz                       0:off  1:off  2:off  3:on   4:on   5:on   6:off
foo                       0:off  1:off  2:off  3:off  4:off  5:off  6:off' \
$chkconfig --list

ok_program 'output of --list with argument' 0 \
'bar                       0:off  1:off  2:on   3:on   4:on   5:on   6:off' \
$chkconfig --list bar

ok_program 'output of --list --deps' 0 \
'bar                       0:off  1:off  2:on   3:on   4:on   5:on   6:off	$remote_fs' \
$chkconfig --list --deps bar

cleanup
