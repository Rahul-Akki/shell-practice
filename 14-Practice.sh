#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]
then
    echo "given num $NUMBER is great"
else
    echo "given num $NUMBER iS LESS"
fi