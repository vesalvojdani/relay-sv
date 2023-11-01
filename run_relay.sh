#!/bin/bash

#Assume script is called from the relay-radar directory
RELAY_DIR=$PWD

if [ $# -lt 1 ]; then
    echo "Usage: run_relay.sh <file_to_analyze>"
    exit 127
elif [ "$1" == "--version" ]; then
    echo "Version: SV-COMP 2024 (v0.10.03)"
    exit 0
fi

#Reset server IP to original file content (perhaps not a problem for SV-COMP overlays).
cp server_ip.bkup server_ip.txt

# 1) "Pick the files to analyze". SV-COMP has only one file to analyze.
# So create the file "gcc-log.txt" with just the argument file.

tmp_dir=`mktemp -d -p .`
trap "rm -rf $tmp_dir" EXIT
CFILE=$(basename ${1%.*}.c) #force file $1 to have a .c extension
cp "$1" "$tmp_dir/$CFILE"
cd "$tmp_dir"
echo "duppy -c $CFILE" > gcc-log.txt

# 2) "Pre-process the source files". First, fix the paths in the scripts.
sed -i "s|RELAYROOT=.*|RELAYROOT=$RELAY_DIR|" $RELAY_DIR/scripts/dump-with-stats.sh
sed -i "s|RELAYROOT=.*|RELAYROOT=$RELAY_DIR|" $RELAY_DIR/scripts/dump-calls.sh
$RELAY_DIR/scripts/dump-with-stats.sh


# 3) Run the analysis
cd ..
sed -i "s/-u jan/-u $(whoami)/" ./relay.sh
./relay_single.sh $tmp_dir/ciltrees
