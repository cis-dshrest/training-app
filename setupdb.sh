#!/bin/bash
#
# Shell script to setup mysql database and users
# PRE-REQ: mysql server has to be running. 

MYSQL=`which mysql`
Q1="CREATE USER explorer@127.0.0.1 IDENTIFIED BY 'search';"
Q2="CREATE DATABASE IF NOT EXISTS exploration;"
Q3="GRANT ALL PRIVILEGES ON exploration.* TO explorer@127.0.0.1;"
Q4="FLUSH PRIVILEGES;"
Q5="SOURCE ./src/main/resources/sql/createtable.sql;"
SQL="${Q1}${Q2}${Q3}${Q4}${Q5}"


$MYSQL -u root -p -e "$SQL"
