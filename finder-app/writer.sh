#!/bin/sh

writefile=$1
writestr=$2

if [ $# -lt 2 ] || [ ! -n "$writestr" ]
then
    echo "Wrong arguments"
    exit 1
fi

# Create file directory
dirpath=$(dirname "$writefile")
echo "Path is $dirpath"
if [ ! -d $dirpath ]
then
	mkdir -p "$dirpath"
fi

# Create file
if [ ! -f $writefile ]
then
        touch $writefile
fi

echo "$writestr" > "$writefile"

# Check if file creation was successful
if [ $? -ne 0]
then    
    echo " Failed to write to file $writefile."
    exit 1
else
    echo "Successfully wrote $writestr to $writefile."
fi

exit