#!/bin/bash

./run_relay.sh tests/18_read_write_lock.i |& tee tests/out-test0.txt
grep -q "Beginning Thread Analysis" tests/out-test0.txt
if [ $? -ne 0 ]; then
  echo "Test 0 failed."
  exit 1
fi

# Run first test
./run_relay.sh tests/01-simple_rc.c |& tee tests/out-test1.txt
grep -q "Possible race" tests/out-test1.txt
if [ $? -ne 0 ]; then
  echo "Test 1 failed."
  exit 1
fi

# Run second test
./run_relay.sh tests/02-simple_nr.c |& tee tests/out-test2.txt
grep -q "Possible race" tests/out-test2.txt
if [ $? -eq 0 ]; then
  echo "Test 2 failed."
  exit 1
fi

echo "All tests succeeded."
