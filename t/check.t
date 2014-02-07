#!/bin/bash

. ./t/libtap.sh
. ./t/fixtures.sh

plan 2

if [ "$(/sbin/runlevel)" = unknown ]; then
	skip_block 2 'cannot run tests without known runlevel'
else
	ok_program '--check' 0 '' \
		$chkconfig --check bar

	ok_program '--check' 1 '' \
		$chkconfig --check foo
fi

cleanup
