CREATE DATABASE '${MDBNAME}';
USE mydatabase;
CREATE USER '${MDBUSERNAME1}'@'localhost' IDENTIFIED BY '${MDBPASSWORD1}';
GRANT ALL PRIVILEGES ON '${MDBNAME}'.* TO '${MDBUSERNAME1}'@'localhost';
ALTER USER '${ROOT}'@'localhost' IDENTIFIED WITH mysql_native_password BY '${ROOTPASSWORD}';
FLUSH PRIVILEGES;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(100)
);

INSERT INTO users (name, username, password) VALUES ('${MDBNAME1}', '${MDBUSERNAME1}', '${MDBPASSWORD1}!');
INSERT INTO users (name, username, password) VALUES ('${MDBNAME2}', '${MDBUSERNAME2}', '${MDBPASSWORD2}!');
