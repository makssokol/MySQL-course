/* Подсчитайте средний возраст пользователей в таблице users */

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Gennady', '1990-10-05'),
  ('Natali', '1984-11-12'),
  ('Alexander', '1985-05-20'),
  ('Sergei', '1988-02-14'),
  ('Ivan', '1998-01-12'),
  ('Mary', '1992-08-29');
  
 SELECT ROUND(AVG(timestampdiff(YEAR, birthday_at, now()))) as 'Average age' FROM users;
 
 
 