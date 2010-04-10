#!/bin/bash
# Recursively greps for some text in files in the current directory with some
# context lines.

GREEN=`echo -e '\033[41;30;1m'`
NORMAL=`echo -e '\033[0m'`
FIND=$1
grep --exclude=*.svn* --exclude=*.swp -rnC 5 "$FIND" * | \
    awk '{split($1, a, "-"); split(a[1], b, ":"); \
    if (b[1] != file) { file=b[1]; print file; } \
    sub(file, "", $0); print $0; }' | \
    sed -e "s/$FIND/$GREEN&$NORMAL/g;s/^[-\:]//g"
