set -e

srcdir=$PWD

tmpdir=$srcdir/tmp
rm -rf $tmpdir
mkdir -p $tmpdir

cleanup() {
	rm -rf $tmpdir
}

cd $tmpdir

chkconfig="$srcdir/chkconfig --root=$tmpdir"

mkdir -p etc/init.d etc/rc{0,1,2,3,4,5}.d
for x in foo bar baz; do
	echo '### BEGIN INIT INFO' > etc/init.d/$x
	echo '# Default-Start:     2 3 4 5' >> etc/init.d/$x
	echo '# Default-Stop:      1' >> etc/init.d/$x
	echo "# Provides:          $x" >> etc/init.d/$x
	echo '# Required-Start:    $remote_fs' >> etc/init.d/$x
	echo '# Required-Stop:     ' >> etc/init.d/$x
	chmod a+x etc/init.d/$x
done
for i in 2 3 4 5; do
	ln -s ../init.d/bar etc/rc${i}.d/S50bar
done
for i in 3 4 5; do
	ln -s ../init.d/baz etc/rc${i}.d/S50baz
done
for x in foo bar baz; do
	echo '### END INIT INFO' >> etc/init.d/$x
done
touch etc/insserv.conf

set +e
