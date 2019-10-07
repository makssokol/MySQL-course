/* Проанализировать запросы, которые выполнялись на занятии, 
 * определить возможные корректировки и/или улучшения (JOIN пока не применять). */

-- таблица друзей пользователя показывает сложно читаемую информацию. Выведем имена и фамилии

SELECT firstname, lastname
FROM users
WHERE id IN
(SELECT initiator_user_id
FROM friend_requests
WHERE target_user_id = 1
AND status = 'approved'
UNION
SELECT target_user_id
FROM friend_requests
WHERE initiator_user_id = 1
AND status = 'approved')
;

/* Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался
 с нашим пользователем.
*/

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES ('10', '1', 'Privet'),
('3', '1', 'Privet');

SELECT from_user_id,
COUNT(from_user_id) AS count_messages
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count_messages DESC
LIMIT 1;

/* Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей. */

SELECT *
FROM likes
WHERE user_id IN
(SELECT user_id
FROM profiles
ORDER BY birthday DESC
LIMIT 10);

-- Так как MySQL не поддерживает LIMIT во вложенных запросах, то делаем через промежуточную таблицу
DROP TABLE IF EXISTS ten_youngest_users;
CREATE TABLE ten_youngest_users
(user_id bigint,
gender char(1),
birthday date,
photo_id bigint,
created_at datetime,
hometown varchar(100));

INSERT INTO ten_youngest_users
SELECT *
FROM profiles
ORDER BY birthday DESC
LIMIT 10;

SELECT count(*)
FROM likes
WHERE user_id IN
(SELECT user_id
FROM ten_youngest_users);

/* Определить кто больше поставил лайков (всего) - мужчины или женщины? */

select
CASE
WHEN (select ((SELECT count(*)
FROM likes
WHERE user_id IN
(SELECT user_id
FROM profiles
WHERE gender = 'm'
)) > 
(SELECT count(*)
FROM likes
WHERE user_id IN
(SELECT user_id
FROM profiles
WHERE gender = 'f'
)))) THEN 'More likes from males'
ELSE 'More likes from females'
END as 'Likes comparison';

/* Найти 10 пользователей, которые проявляют наименьшую активность 
 * в использовании социальной сети. */

-- определим активность как сумму лайков и сообщений и объединим 2 таблицы в одну
DROP TABLE IF EXISTS users_activity;

CREATE TABLE users_activity
(user_id bigint,
act_amount int);

INSERT INTO users_activity
select user_id, count(id)
FROM likes GROUP BY user_id;

INSERT INTO users_activity
select from_user_id, count(id)
FROM messages GROUP BY from_user_id;

SELECT user_id, count(act_amount) AS activity
FROM users_activity
GROUP BY user_id
ORDER BY activity
limit 10
;



