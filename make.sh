#!/bin/bash

cd build
# make -j$JNUM
# cd ..
# find . -type f -name '*.uf2'
apt-get install libring_buffer_lib
ld -lring_buffer_lib --verbose