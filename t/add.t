#!/bin/bash

. ./t/libtap.sh
. ./t/fixtures.sh

plan 1

cp etc/init.d/foo etc/init.d/foo2
sed -i 's/foo/foo2/g' etc/init.d/foo2
ok_program '--add' 0 \
'foo2                      0:off  1:off  2:on   3:on   4:on   5:on   6:off' \
$chkconfig --add foo2

cleanup
