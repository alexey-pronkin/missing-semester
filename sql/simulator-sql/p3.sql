-- Задание:
-- Для начала решим простую задачу: выведите id всех уникальных пользователей из таблицы user_actions. Результат отсортируйте по возрастанию id.

-- Поле в результирующей таблице: user_id

SELECT DISTINCT user_id FROM user_actions ORDER BY user_id ASC

-- Задание:
-- Примените DISTINCT сразу к двум колонкам таблицы courier_actions и отберите уникальные пары значений courier_id и order_id.
-- Результат отсортируйте по двум колонкам по возрастанию сначала id курьера, затем id заказа.

-- Поля в результирующей таблице: courier_id, order_id

SELECT DISTINCT courier_id, order_id FROM courier_actions ORDER BY courier_id ASC, order_id ASC
-- Задание:
-- Посчитайте максимальную и минимальную цены товаров в таблице products. Поля назовите соответственно max_price, min_price.
-- Пояснение:
-- В одном запросе можно использовать сразу несколько агрегирующих функций — если необходимо, то даже по нескольким разным колонкам.

-- Поля в результирующей таблице: max_price, min_price

SELECT MAX(price) as max_price, MIN(price) as min_price FROM products

-- Задание:
-- С помощью COUNT(DISTINCT) посчитайте количество уникальных пользователей сервиса, количество уникальных заказов, поделите одно на другое и рассчитайте, сколько заказов приходится на одного пользователя.  
-- Показатель числа заказов на пользователя округлите до двух знаков после запятой. 
-- В результирующей таблице отобразите все три значения — поля назовите соответственно unique_users, unique_orders, orders_per_user. Все расчёты проведите на основе таблицы user_actions.

-- Поля в результирующей таблице: unique_users, unique_orders, orders_per_user

SELECT COUNT(DISTINCT user_id) as unique_users, COUNT(DISTINCT order_id) as unique_orders,
ROUND(COUNT(DISTINCT order_id)/COUNT(DISTINCT user_id)::DECIMAL, 2) as orders_per_user
FROM user_actions;

-- Задание:
-- Посчитайте количество курьеров женского пола в таблице couriers. Полученный столбец назовите couriers_count.

-- Поле в результирующей таблице: couriers_count

SELECT COUNT(courier_id) as couriers_count
FROM couriers
WHERE sex = 'female';

-- Задание:
-- С помощью функции AGE() и агрегирующей функции рассчитайте возраст самого молодого курьера мужского пола в таблице couriers. 
-- Возраст измерьте количеством лет, месяцев и дней (как в примере) и переведите его в тип VARCHAR. 
-- В качестве даты, относительно которой считать возраст, используйте свою текущую дату (либо не указывайте её вовсе, как показано в примерах). Полученную колонку со значением возраста назовите min_age.

-- Поле в результирующей таблице: min_age

SELECT AGE(current_date, MAX(birth_date))::VARCHAR as min_age
FROM couriers WHERE sex = 'male'

-- Задание:
-- Давайте представим, что один из молодых пользователей сервиса сделал заказ, в который вошли сухарики, чипсы и энергетический напиток. 
-- Посчитайте стоимость такого заказа. 
-- Колонку с рассчитанной стоимостью заказа назовите order_price.

-- Поле в результирующей таблице: order_price

-- Пояснение:

-- Решить эту задачу можно как с помощью операторов WHERE, так и с помощью конструкции CASE, которую мы рассматривали на прошлых уроках. К её результату тоже можно применять агрегирующие функции:

-- SELECT SUM( 
--      CASE
--      WHEN logical_expression_1 THEN expression_1
--      WHEN logical_expression_2 THEN expression_2
--      ...
--      ELSE expression_else
--      END
-- ) AS sum_case
-- FROM table


-- SELECT
-- SUM( 
--      CASE
--      WHEN name = 'сухарики' THEN price
--      WHEN name = 'чипсы' THEN price
--      WHEN name = 'энергетический напиток' THEN price
--      END
-- ) AS order_price
-- FROM products

SELECT sum(price) as order_price
FROM products
WHERE name IN ('сухарики', 'чипсы', 'энергетический напиток');

-- Задание:

-- Посчитайте стоимость заказа, в котором будут три пачки сухариков, две пачки чипсов и один энергетический напиток. 
-- Колонку с рассчитанной стоимостью заказа назовите order_price.

-- Поле в результирующей таблице: order_price

SELECT
SUM( 
     CASE
     WHEN name = 'сухарики' THEN price * 3
     WHEN name = 'чипсы' THEN price * 2 
     WHEN name = 'энергетический напиток' THEN price
     END
) AS order_price
FROM products;

-- Задание:
-- Посчитайте, сколько пользователей никогда не отменяли свой заказ. 
-- Для этого из общего числа всех уникальных пользователей отнимите число уникальных пользователей, которые хотя бы раз отменяли заказ. 
-- Подумайте, какое условие необходимо указать в FILTER, чтобы получить корректный результат. Полученный столбец назовите users_count.

-- Поле в результирующе таблице: users_count

-- Когда решите задачу, подумайте, смогли бы мы сейчас с ней справиться без агрегатных выражений.

SELECT COUNT(distinct user_id) - COUNT(distinct user_id) FILTER (WHERE action = 'cancel_order') as users_count
FROM user_actions;