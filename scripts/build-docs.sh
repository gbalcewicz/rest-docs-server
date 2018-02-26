#!/bin/bash

sphinx-build -b html /docs/$(basename $1) /docs-html/$(basename $1)
