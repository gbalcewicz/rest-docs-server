#!/bin/bash

sphinx-build -b latex /docs/$(basename $1) /docs-pdf/$(basename $1)
cd /docs-pdf/$(basename $1) && make
