#!bin bash
CAR=$1

if [ $CAR -lt 600000 ]
then
    echo "Car price $CAR is in my Budget to buy"
else
    echo "Car price $CAR is not in my Budget"
fi