#!/bin/bash
#Called by CI from root directory (./scripts/build.sh)

eval $(opam config env)

cd cil
make

cd ..
make
