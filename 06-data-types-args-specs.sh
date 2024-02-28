#!bin/bash

SUM=( $1 + $2 )

echo "Sum of numbers is : $SUM"

echo "Ref: "
echo "Total no. of args passed : $#"
echo "Args Passed : $@"
echo "name of the current script : $0"
