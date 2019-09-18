/* 1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, 
задав в нем логин и пароль, который указывался при установке.
Сделано.
2. Создайте базу данных example, разместите в ней таблицу users, 
состоящую из двух столбцов, числового id и строкового name.
 */

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT,
	name varchar(100)
);

/* 3. Создайте дамп базы данных example из предыдущего задания, 
   разверните содержимое дампа в новую базу данных sample.
   
   Сделано командами mysqldump example > example_dump.sql и mysql sample < example_dump.sql
	Файл example_dump.sql отправлен в репозиторий git.
 */

/* 4. Сделано командой mysqldump mysql help_keyword | head -n 100 > hk_dump.sql.
 * однако ограничить таблицу 100 строками не удалось.
 */

