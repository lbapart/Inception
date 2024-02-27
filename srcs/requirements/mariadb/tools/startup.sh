#!/bin/bash
export $(egrep -v '^#' .env | xargs)
sed -i 's/${NAME1}/'"$NAME1"'/g' /init.sql
sed -i 's/${USERNAME1}/'"$USERNAME1"'/g' /init.sql
sed -i 's/${PASSWORD1}/'"$PASSWORD1"'/g' /init.sql
sed -i 's/${NAME2}/'"$NAME2"'/g' /init.sql
sed -i 's/${USERNAME2}/'"$USERNAME2"'/g' /init.sql
sed -i 's/${PASSWORD2}/'"$PASSWORD2"'/g' /init.sql

# Start the MySQL server in the background
mysqld_safe &

# Wait for the server to be ready
while ! mysqladmin ping --silent; do
    sleep 1
done

# Run the SQL script
mysql < /init.sql

# Shut down the server
mysqladmin shutdown

# Wait for the server to shut down
sleep 5

# Start the server again
mysqld_safe &