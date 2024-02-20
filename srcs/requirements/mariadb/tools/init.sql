CREATE DATABASE mydatabase;
USE mydatabase;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(100)
);

INSERT INTO users (name, username, password) VALUES ('${MDBNAME1}', '${MDBUSERNAME1}', '${MDBPASSWORD1}!');
INSERT INTO users (name, username, password) VALUES ('${MDBNAME2}', '${MDBUSERNAME2}', '${MDBPASSWORD2}!');