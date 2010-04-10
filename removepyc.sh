#!/bin/sh
echo "recursively removing .pyc files from"
pwd
rm -rf `find . -name .pyc`