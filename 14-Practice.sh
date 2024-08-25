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

VALIDATE(){
    if [ $? -ne 0  ]
    then
        echo "ERROR :: Installing  is failed"
        exit 1
    else
        echo "Installing  is SUCCESS"
    fi
}

if [ $ID -ne 0  ]
then
    echo "ERROR :: Please run with root access"
    exit 1
else
    echo " You are root user "
fi

yum install mysql -y