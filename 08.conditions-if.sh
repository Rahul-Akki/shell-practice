#!bin bash
CAR=$1

if [$CAR -lt 600000]
then
    echo "Car price is in my Budget to buy"
else
    echo "Car price is not in my Budget"
fi
