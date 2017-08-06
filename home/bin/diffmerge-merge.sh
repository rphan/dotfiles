#!/bin/sh

localPath="$(cygpath --mixed --absolute "$2")"
basePath="$(cygpath --mixed --absolute "$1")"
remotePath="$(cygpath --mixed --absolute "$3")"
resultPath="$(cygpath --mixed --absolute "$4")"

if [ ! -f $basePath ]
then
    basePath="$(cygpath --mixed --absolute ~/diffmerge-empty)"
fi

"/cygdrive/C/Program Files/SourceGear/DiffMerge/diffmerge.exe" --merge --result="$resultPath" "$localPath" "$basePath" "$remotePath" --title1="Mine" --title2="Merged: $4" --title3="Theirs"
