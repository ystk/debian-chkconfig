#!/bin/bash

. ./t/libtap.sh
. ./t/fixtures.sh

plan 1

skip TODO
#$chkconfig --set foo on bar on baz off
#VISUAL=touch ok_program '--edit' 0 '' \
#$chkconfig --edit

cleanup
