#!/bin/bash

# Simple script to clear the screen, then ls
# Passes through your parameters to ls directly

clear
ls --color "$@"
