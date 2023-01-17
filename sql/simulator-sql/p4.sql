-- Задание:

-- С помощью группировки посчитайте количество курьеров мужского и женского пола в таблице couriers. 
-- Новую колонку с числом курьером назовите couriers_count. 
-- Результат отсортируйте по этой колонке по возрастанию.

-- Поля в результирующей таблице: sex, couriers_count

SELECT sex, COUNT(courier_id) AS couriers_count
FROM couriers
GROUP BY sex
ORDER BY couriers_count ASC


-- Задание:

-- Напишите SQL-запрос к таблице couriers и выведите всю информацию о курьерах, у которых не указан их день рождения. 
-- Результат отсортируйте по возрастанию id.

-- Поля в результирующей таблице: courier_id, birth_date, sex

SELECT courier_id, birth_date, sex FROM couriers WHERE birth_date IS NULL ORDER BY courier_id ASC

-- Задание:

-- Разбейте пользователей из таблицы users на группы по возрасту (возраст измеряем количеством полных лет) 
-- и посчитайте число пользователей каждого возраста. 
-- Колонку с возрастом назовите age, а колонку с числом пользователей — users_count. 
-- Отсортируйте полученный результат по возрастанию возраста.
-- Пояснение:
-- Обратите внимание, что в данной задаче вам необходимо провести группировку по новому расчётному полю с возрастом.
-- В этой ситуации важно помнить, что колонки, указанные в SELECT, должны находиться и в GROUP BY (если они не используются в агрегационных функциях).
-- При этом в GROUP BY допускается использование алиаса колонки, указанного в блоке SELECT, т.е. повторно производить вычисления в GROUP BY не обязательно. 

-- Поля в результирующей таблице: age, users_count

SELECT DATE_PART('year', AGE(birth_date)) as age, COUNT(user_id) as users_count
FROM users
GROUP BY age
ORDER BY age ASC;

-- Задание:

-- Вновь разбейте пользователей из таблицы users на группы по возрасту (возраст измеряем количеством полных лет),
-- только теперь добавьте в группировку пол пользователя. 
-- В результате в каждой возрастной группе должно появиться ещё по две подгруппы с полом. 
-- В каждой такой подгруппе посчитайте число пользователей. 
-- Все NULL значения в колонке birth_date заранее отфильтруйте с помощью WHERE. 
-- Колонку с возрастом назовите age, а колонку с числом пользователей — users_count, имя колонки с полом оставьте без изменений. 
-- Отсортируйте полученную таблицу сначала по колонке с возрастом по возрастанию,
-- затем по колонке с полом — тоже по возрастанию.

-- Поля в результирующей таблице: age, sex, users_count

SELECT DATE_PART('year', AGE(birth_date)) as age, sex, COUNT(user_id) as users_count
FROM users
WHERE birth_date IS NOT NULL
GROUP BY age, sex
ORDER BY age ASC, sex ASC;

-- Задание:

-- Используя функцию DATE_TRUNC, посчитайте, сколько заказов было сделано и сколько было отменено в каждом месяце. 
-- Расчёты проводите по таблице user_actions. Колонку с усечённой датой назовите month, колонку с количеством заказов — orders_count. 
-- Результат отсортируйте сначала по месяцам — по возрастанию, затем по типу действия — тоже по возрастанию.

-- Поля в результирующей таблице: month, action, orders_count

SELECT DATE_TRUNC('month', time) as month, action, COUNT(order_id) as orders_count
FROM user_actions
GROUP BY month, action
ORDER BY month ASC, action ASC

-- Задание:

-- Посчитайте количество товаров в каждом заказе из таблицы orders, примените к этим значениям группировку и посчитайте количество заказов в каждой группе. 
-- Выведите две колонки: количество товаров в заказе и число заказов с таким количеством. 
-- Колонки назовите соответственно order_size и orders_count. 
-- Результат отсортируйте по возрастанию числа товаров в заказе.

-- Поля в результирующей таблице: order_size, orders_count

SELECT array_length(product_ids, 1) as order_size, COUNT(order_id) as orders_count
FROM orders
GROUP BY order_size
ORDER BY order_size ASC

-- Задание:

-- Посчитайте количество товаров в каждом заказе из таблицы orders, примените к этим значениям группировку и посчитайте количество заказов в каждой группе. 
-- Выведите две колонки: количество товаров в заказе и число заказов с таким количеством. 
-- Колонки назовите соответственно order_size и orders_count. 
-- Результат отсортируйте по возрастанию числа товаров в заказе.

-- Поля в результирующей таблице: order_size, orders_count


-- Дополните предыдущий запрос оператором HAVING и отберите только те размеры заказов, общее число которых превышает 5000. 
-- Вновь выведите две колонки: количество товаров в заказе и число заказов с таким количеством. 
-- Колонки назовите соответственно order_size и orders_count. Результат отсортируйте по возрастанию числа товаров в заказе.

-- Поля в результирующей таблице: order_size, orders_count

SELECT array_length(product_ids, 1) as order_size, COUNT(order_id) as orders_count
FROM orders
GROUP BY order_size
HAVING COUNT(order_id) > 5000
ORDER BY order_size ASC


-- Задание:

-- Из таблицы courier_actions отберите id трёх курьеров, доставивших в сентябре 2022 года наибольшее количество заказов.
-- Выведите две колонки — id курьера и число доставленных заказов.
-- Колонку с числом доставленных заказов назовите delivered_orders.
-- Пояснение:
-- Помните, что в таблице courier_actions есть информация как о созданных, так и о доставленных заказах.
-- Поля в результирующей таблице: courier_id, delivered_orders

SELECT courier_id, COUNT(DISTINCT order_id) as delivered_orders
FROM courier_actions
WHERE action='deliver_order' AND DATE_PART('year', time)='2022' AND DATE_PART('month', time)='9'
GROUP BY courier_id
ORDER BY delivered_orders DESC
LIMIT 3

-- Задание:

-- А теперь отберите id только тех курьеров, которые в сентябре 2022 года успели доставить только по одному заказу. 
-- Таблица та же — courier_actions. Вновь выведите две колонки — id курьера и число доставленных заказов. 
-- Колонку с числом заказов назовите delivered_orders. Результат отсортируйте по возрастанию id курьера.

-- Поля в результирующей таблице: courier_id, delivered_orders

SELECT courier_id, COUNT(action) as delivered_orders
FROM courier_actions
WHERE (DATE_PART('year', time)='2022') AND (DATE_PART('month', time)='9') AND (action='deliver_order')
GROUP BY courier_id
HAVING COUNT(action)=1
ORDER BY courier_id ASC

-- Ой, к нам в кабинет снова постучались! 
-- Это опять маркетологи: говорят, что хотят разослать пуш-уведомление со специальным предложением.
-- Аудитория — пользователи, которые давно не делали у нас заказ.

-- Задание:

-- Из таблицы user_actions отберите пользователей, у которых последний заказ был создан до 8 сентября 2022 года.
-- Выведите только их id, дату создания заказа выводить не нужно.
-- Результат отсортируйте по возрастанию id пользователя.

-- Поле в результирующей таблице: user_id

SELECT user_id
FROM user_actions
WHERE action='create_order'
GROUP BY user_id
HAVING max(time) < make_date(2022, 9, 8)
ORDER BY user_id ASC

-- Задание:

-- Для каждого пользователя в таблице user_actions посчитайте долю отменённых заказов. 
-- Выведите две колонки: id пользователя и рассчитанный показатель. 
-- Новую колонку с показателем округлите до двух знаков после запятой и назовите cancel_rate. 
-- Результат отсортируйте по возрастанию id пользователя.
-- Пояснение:
-- Чтобы посчитать долю отменённых заказов, необходимо поделить количество отменённых заказов на общее число уникальных заказов пользователя. 
-- Помните, что для получения корректного результата деления нужно хотя бы одно из значений привести к типу DECIMAL.

-- Поля в результирующей таблице: user_id, cancel_rate

SELECT user_id, ROUND(COUNT(action) FILTER(WHERE action='cancel_order') / (COUNT(DISTINCT order_id)::DECIMAL), 2) as cancel_rate
FROM user_actions
GROUP BY user_id
ORDER BY user_id ASC

-- Задание:
-- Разбейте пользователей из таблицы users на 4 возрастные группы:
-- от 19 до 24 лет;
-- от 25 до 29 лет;
-- от 30 до 35 лет;
-- от 36 до 41 года.
-- Посчитайте число пользователей, попавших в каждую возрастную группу.
-- Группы назовите соответственно «19-24», «25-29», «30-35», «36-41» (без кавычек).
-- Выведите наименования групп и число пользователей в них.
-- Колонку с наименованием групп назовите group_age, а колонку с числом пользователей — users_count.
-- Отсортируйте полученную таблицу по колонке с наименованием групп по возрастанию.
-- Поля в результирующей таблице: group_age, users_count
SELECT
  CASE
    WHEN DATE_PART('year', AGE(birth_date)) >= 19
    AND DATE_PART('year', AGE(birth_date)) <= 24 THEN '19-24'
    WHEN DATE_PART('year', AGE(birth_date)) >= 25
    AND DATE_PART('year', AGE(birth_date)) <= 29 THEN '25-29'
    WHEN DATE_PART('year', AGE(birth_date)) >= 30
    AND DATE_PART('year', AGE(birth_date)) <= 35 THEN '30-35'
    WHEN DATE_PART('year', AGE(birth_date)) >= 36
    AND DATE_PART('year', AGE(birth_date)) <= 41 THEN '36-41'
  END as group_age,
  count(user_id) as users_count
FROM
  users
WHERE
  birth_date IS NOT NULL
GROUP BY
  group_age
ORDER BY
  group_age ASC
SELECT
  CASE
    WHEN DATE_PART('year', AGE(birth_date)) BETWEEN 19
    AND 24 THEN '19-24'
    WHEN DATE_PART('year', AGE(birth_date)) BETWEEN 25
    AND 29 THEN '25-29'
    WHEN DATE_PART('year', AGE(birth_date)) BETWEEN 30
    AND 35 THEN '30-35'
    WHEN DATE_PART('year', AGE(birth_date)) BETWEEN 36
    AND 41 THEN '36-41'
  END AS group_age,
  COUNT(user_id) AS users_count
FROM
  users
WHERE
  birth_date IS NOT NULL
GROUP BY
  group_age
ORDER BY
  group_age