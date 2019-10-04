/* 2. Таблица users была неудачно спроектирована. 
 * Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались 
 * значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
 * сохранив введеные ранее значения.
 */

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
DROP TABLE if EXISTS users;

CREATE TABLE users (
	id INT,
	name varchar(100),
	created_at varchar(100),
	updated_at varchar(100)
);

INSERT INTO users (id, name, created_at, updated_at)
	VALUES ('1', 'Pavel', '20.10.2017 8:10', '20.10.2017 8:10'),
			('2', 'Peter', '30.11.2018 9:20', '30.11.2018 9:20');
		
UPDATE users SET 
created_at = str_to_date(created_at, '%d.%m.%Y %H:%i'),
updated_at = str_to_date(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE users MODIFY created_at datetime;
ALTER TABLE users MODIFY updated_at datetime;




