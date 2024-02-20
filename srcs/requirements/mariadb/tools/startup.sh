#!/bin/bash
export $(egrep -v '^#' .env | xargs)
sed -i 's/${NAME1}/'"$NAME1"'/g' /init.sql
sed -i 's/${USERNAME1}/'"$USERNAME1"'/g' /init.sql
sed -i 's/${PASSWORD1}/'"$PASSWORD1"'/g' /init.sql
sed -i 's/${NAME2}/'"$NAME2"'/g' /init.sql
sed -i 's/${USERNAME2}/'"$USERNAME2"'/g' /init.sql
sed -i 's/${PASSWORD2}/'"$PASSWORD2"'/g' /init.sql
mysqld_safe &
mysql < /init.sql