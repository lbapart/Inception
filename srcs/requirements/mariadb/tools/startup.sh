#!/bin/bash
mysqld_safe &
mysql < init.sql
mysqladmin -u root -p$ROOTPASSWORD shutdown
sleep 5
mysqld_safe
