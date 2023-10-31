#!/bin/bash
#Called by CI from root directory (./scripts/build.sh)

cd cil
make

cd ..
make
