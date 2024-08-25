#!/bin/bash

#Algorithm to install mysql
#1 --> Check the sudo access --> 
#1.1 --> if we do not have sudo asses --> exit --> id -u -ne 0 
#1.2 --> if we have sudo asses --> Move to next step
#2 --> check if already installed --> < yum list installed mysql >
#2.1 --> if already installed --> exit
#2.1 --> if not installed --> Move to next step
#3 --> install my sql --> < yum install mysql -y >
#3.1 --> if installed Sucessfully --> Print installed sucessfully
#3.1 --> if not installed Sucessfully --> Print Error

ID=$(id -u)
TIMESTAMP=$(date +%m-%d-%Y-%A-%X)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "Status: $2 $R ...Failed $G"
        exit 1
    else 
        echo -e " Status: $2 $G ...Sucess$N "
    fi
}


if [ $ID -ne 0  ]
then
    echo -e "$R ERROR :: Please run with root access $N"
    exit 1
else
    echo -e "$G You are root user $N "
fi

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "Inastallation of $package "
    else
        echo -e "$Y Skipping... $N"
    fi
done