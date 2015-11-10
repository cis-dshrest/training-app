#!/bin/bash
#
# Shell script to setup mysql database and users
# PRE-REQ: mysql server has to be running. 

MYSQL=`which mysql`
Q1="CREATE DATABASE IF NOT EXISTS exploration;"
Q2="GRANT ALL ON exploration.* TO explorer@127.0.0.1 IDENTIFIED BY 'search';"
Q3="FLUSH PRIVILEGES;"
Q4="SOURCE $1;"
SQL="${Q1}${Q2}${Q3}${Q4}"


$MYSQL -u root -p -e "$SQL"
