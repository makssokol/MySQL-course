/* Составьте список пользователей users, которые осуществили 
 * хотя бы один заказ orders в интернет магазине.
 */

USE shop;

SELECT name
FROM users
WHERE id = (SELECT user_id FROM orders);

/* Выведите список товаров products и разделов catalogs, который соответствует товару. */

SELECT
  p.name,
  c.name
FROM
  catalogs AS c
JOIN
  products AS p
WHERE
  c.id = p.catalog_id;
 
/* Пусть имеется таблица рейсов flights (id, from, to) и 
таблица городов cities (label, name). Поля from, to и label 
содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов. */
 
 DROP TABLE IF EXISTS flights;
 CREATE TABLE flights (
 id SERIAL PRIMARY KEY,
 `from` varchar(100),
 `to` varchar(100)
 );
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
label varchar(100),
name varchar(100)
);
INSERT INTO flights (`from`, `to`) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

INSERT INTO cities VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

SELECT
id,
(SELECT name FROM cities WHERE label = flights.`from`) AS `from`,
(SELECT name FROM cities WHERE label = flights.`to`) AS `to`
FROM flights;




 
 
 
 
