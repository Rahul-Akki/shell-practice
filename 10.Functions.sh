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

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
        then
            echo -e "Status: $2 $R ...Failed $G"
            exit 1
        else 
            echo -e " Status: $2 $G ...Sucess$N "
        fi
}
 
ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo -e "$R Error:$N Please Run with the root access "
    exit 1
else 
    echo -e "$G Status:$N You are the root user"
fi

yum list installed mysql 

if [ $? -ne 0 ]
then
    echo -e "$G Status:$N Mysql not yet installed in the system, Installation in progress.."
    yum install mysql -y
    VALIDATE $? "MySQL Installation"
else 
    echo -e "$Y Status: $N Mysql is already installed in the system "
    exit 1
fi