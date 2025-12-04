#!/bin/bash
mkdir -p exercice_007/source && echo "Test" > exercice_007/source/test.txt && tar -cf - -C exercice_007 source | gzip | tee exercice_007/archive.tar.gz > /dev/null
