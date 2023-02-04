-- Задание:

-- Используя данные из таблицы user_actions, рассчитайте среднее число заказов всех пользователей нашего сервиса.
-- Для этого сначала в подзапросе посчитайте, сколько заказов сделал каждый пользователь,
-- а затем обратитесь к результату подзапроса в блоке FROM и уже в основном запросе усредните количество заказов по всем пользователям.
-- Полученное среднее число заказов всех пользователей округлите до двух знаков после запятой.
-- Колонку с этим значением назовите orders_avg.
-- Пояснение:
-- К колонкам из подзапроса можно применять агрегирующие функции — так же, как если бы мы обращались к колонкам исходных таблиц.

-- Поле в результирующей таблице: orders_avg

SELECT
  ROUND(AVG(number_orders), 2) as orders_avg
FROM
  (
    SELECT
      COUNT(DISTINCT order_id) as number_orders,
      user_id
    FROM
      user_actions
    GROUP BY
      user_id
  ) as c_orders

-- Задание:

-- Используя данные из таблицы user_actions, рассчитайте среднее число заказов всех пользователей нашего сервиса.
-- Для этого сначала в подзапросе посчитайте, сколько заказов сделал каждый пользователь,
-- а затем обратитесь к результату подзапроса в блоке FROM и уже в основном запросе усредните количество заказов по всем пользователям.
-- Полученное среднее число заказов всех пользователей округлите до двух знаков после запятой.
-- Колонку с этим значением назовите orders_avg.
-- Пояснение:
-- К колонкам из подзапроса можно применять агрегирующие функции — так же, как если бы мы обращались к колонкам исходных таблиц.
-- Вместо подзапроса используйте оператор WITH и табличное выражение.

-- Поле в результирующей таблице: orders_avg

WITH c_orders AS (SELECT
      COUNT(DISTINCT order_id) as number_orders,
      user_id
    FROM
      user_actions
    GROUP BY
      user_id)
SELECT
  ROUND(AVG(number_orders), 2) as orders_avg
FROM c_orders

-- Задание:
-- Выведите из таблицы products информацию о всех товарах кроме самого дешёвого.
-- Результат отсортируйте по убыванию id товара.
-- Поля в результирующей таблице: product_id, name, price

SELECT
  product_id,
  name,
  price
FROM
  products
WHERE
  price !=(
    SELECT
      MIN(price)
    FROM
      products
  )
  ORDER BY product_id DESC

-- Задание:

-- Выведите информацию о товарах в таблице products, цена на которые превышает среднюю цену всех товаров на 20 рублей и более. 
-- Результат отсортируйте по убыванию id товара.

-- Поля в результирующей таблице: product_id, name, price

SELECT
  product_id,
  name,
  price
FROM
  products
WHERE
  price > (
    SELECT
      AVG(price)
    FROM
      products
  ) + 20
  ORDER BY product_id DESC

-- Задание:

-- Посчитайте количество уникальных клиентов в таблице user_actions, сделавших за последнюю неделю хотя бы один заказ. 
-- Полученную колонку со значением назовите users_count. 
-- В качестве текущей даты, от которой откладывать неделю, используйте последнюю дату в той же таблице user_actions.

-- Поле в результирующей таблице: users_count

SELECT COUNT(DISTINCT user_id) as users_count
FROM user_actions
WHERE time > (SELECT MAX(time) FROM user_actions ) - INTERVAL '1 week'

-- Задание:

-- С помощью функции AGE() и агрегирующей функции снова рассчитайте возраст самого молодого курьера мужского пола в таблице couriers,
-- но в этот раз в качестве первой даты используйте последнюю дату из таблицы courier_actions.
-- Чтобы получилась именно дата, перед применением функции AGE() переведите посчитанную последнюю дату в формат DATE, как мы делали в этом задании.
-- Возраст курьера измерьте количеством лет, месяцев и дней и переведите его в тип VARCHAR. Полученную колонку со значением возраста назовите min_age.

-- Поле в результирующей таблице: min_age

SELECT
  AGE(
    (
      SELECT
        MAX (time)
      FROM
        courier_actions
    ) :: DATE,
    MAX(birth_date)
  ) :: VARCHAR as min_age
FROM
  couriers
WHERE
  sex = 'male'

-- Задание:

-- Из таблицы user_actions с помощью подзапроса или табличного выражения отберите все заказы, которые не были отменены пользователями.
-- Выведите колонку с id этих заказов.
-- Результат запроса отсортируйте по возрастанию id заказа.
-- Добавьте LIMIT 1000.

-- Поле в результирующей таблице: order_id

SELECT
  order_id
FROM
  user_actions
WHERE
  order_id NOT IN (
    SELECT
      order_id
    FROM
      user_actions
    WHERE
      action = 'cancel_order'
  )
ORDER BY
  order_id
LIMIT
  1000

-- Задание:

-- Используя данные из таблицы user_actions, рассчитайте, сколько заказов сделал каждый пользователь и отразите это в столбце orders_count. 
-- В отдельном столбце orders_avg напротив каждого пользователя укажите среднее число заказов всех пользователей, округлив его до двух знаков после запятой. 
-- Также для каждого пользователя посчитайте отклонение числа заказов от среднего значения. 
-- Отклонение считайте так: число заказов «минус» округлённое среднее значение. 
-- Колонку с отклонением назовите orders_diff. Результат отсортируйте по возрастанию id пользователя. Добавьте LIMIT 1000.

-- Пояснение:

-- В этой задаче можно использовать подзапрос, написанный в первых заданиях этого урока. Чтобы не пришлось дважды писать один и тот же подзапрос, можно использовать оператор WITH.

-- Поля в результирующей таблице: user_id, orders_count, orders_avg, orders_diff

WITH orders_count_table AS (SELECT user_id, COUNT(DISTINCT order_id) as orders_count
FROM user_actions
GROUP BY user_id)
-- SELECT user_id , (SELECT ROUND(AVG(orders_count), 2) as orders_avg, (orders_count-ROUND(AVG(orders_count), 2)) as orders_diff FROM orders_count_table)
-- FROM  user_actions
-- ORDER BY user_id
-- LIMIT 1000


-- WITH c_orders AS (SELECT
--       COUNT(DISTINCT order_id) as number_orders,
--       user_id
--     FROM
--       user_actions
--     GROUP BY
--       user_id)
-- SELECT
--   ROUND(AVG(number_orders), 2) as orders_avg
-- FROM c_orders