/* 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 Заполните их текущими датой и временем.
 */

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
DROP TABLE if EXISTS users;

CREATE TABLE users (
	id INT,
	name varchar(100)
);

ALTER TABLE users ADD created_at datetime;
ALTER TABLE users ADD updated_at datetime;
UPDATE users 
	SET created_at = now();
UPDATE users
	SET updated_at = now();
