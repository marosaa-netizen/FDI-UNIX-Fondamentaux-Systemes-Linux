#!/bin/bash
man apt | grep -- "apt-get(8)" | tail -n +2 | head -n -3 | sed 's/^[[:space:]]*//'
