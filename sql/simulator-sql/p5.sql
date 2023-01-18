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

Поле в результирующей таблице: orders_avg
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
    