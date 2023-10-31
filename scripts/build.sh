#!/bin/bash
#Called by CI from root directory (./scripts/build.sh)

eval $(opam env --switch=. --set-switch)

cd cil
./configure
make

cd ..
make
