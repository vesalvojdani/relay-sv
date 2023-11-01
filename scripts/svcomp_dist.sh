#!/bin/sh
#run from root directory
ROOT=`pwd`
DIST="dist/relay"
rm -rf $DIST
mkdir -p $DIST/scripts $DIST/tests
cp race_anal.exe server.exe fix_id_cg.exe scc_stats.exe \
    relay_single.sh server.sh relay.sh run_relay.sh \
    *.cfg* server_ip* \
    $DIST
cp scripts/next_num.py scripts/dump* scripts/duppy $DIST/scripts
cp tests/*.c $DIST/tests
#cp README.md LICENSE simple.c $DIST
mkdir -p $DIST/cil/obj/x86_LINUX $DIST/cil/lib $DIST/cil/bin
cp cil/obj/x86_LINUX/cilly.* $DIST/cil/obj/x86_LINUX
cp cil/lib/*.pm $DIST/cil/lib
cp cil/bin/cilly $DIST/cil/bin
cat cil/bin/CilConfig.pm | sed -e "s|$ROOT|..|" > $DIST/cil/bin/CilConfig.pm

cd $DIST/..
#zip -r relay.zip relay
