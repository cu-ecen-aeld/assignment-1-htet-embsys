#!/bin/sh

filesdir=$1
searchstr=$2

if [ $# -ne 2 ]
then
    echo "Two arguments are required."
    exit 1
fi

if [ ! -d $filesdir ]
then
    echo "First argument does not represent a directory on the filesystem"
    exit 1
fi

file_count=$(ls -1 $filesdir | wc -l)
matching_lines_count=$(grep -nri $searchstr $filesdir | wc -l)

echo "The number of files are $file_count and the number of matching lines are $matching_lines_count"

exit