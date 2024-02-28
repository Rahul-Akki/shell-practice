#!bin/bash

SUM=( $1 + $2 )

echo "Sum of numbers is : $SUM"

echo "---Notes---"
echo "Total no.of args passed : $#"
echo "Args Passed : $@"
echo "Name of the current script : $0"
0