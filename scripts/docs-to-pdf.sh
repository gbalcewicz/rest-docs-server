#!/bin/bash

sphinx-build -b latex /docs/$(basename $1) /docs-pdf/$(basename $1)
cd /docs-pdf/$(basename $1) && make && find . -not \(  -name '*.pdf' -o -name '.' \) -print0 | xargs -0 -I {} rm -rf {}
