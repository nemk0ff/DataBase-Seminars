-- 1. Выясните, на каких маршрутах используются самолеты компании Boeing. 
-- В выборке вместо кода модели должно выводиться её наименование 
-- (например, вместо кода 733 должно выводиться Boeing 737-300). 
-- Указание: можно работать с routes, aircrafts
SELECT t2.flight_id, 
		t2.departure_airport, 
		t2.arrival_airport,
		t1.model->>'en' as model
FROM (
	aircrafts_data t1
	JOIN
	flights t2
	ON t1.aircraft_code = t2.aircraft_code
	)
WHERE t1.model->>'en' LIKE 'Boeing%';

-----------------------------------------------------------------------
-- 2. Выяснить, между какими парами городов летают самолеты Boeing 777-300. 
SELECT DISTINCT
	r.departure_city,
	r.arrival_city
FROM 
	routes as r
	JOIN 
	aircrafts_data as a
	ON
	r.aircraft_code = a.aircraft_code
WHERE
	a.model->>'en' = 'Boeing 777-300'

-----------------------------------------------------------------------
-- 3. Модифицировать прошлый запрос так, 
-- чтобы каждая пара городов была выведена только один раз. 
SELECT DISTINCT
	LEAST(r.departure_city, r.arrival_city),
	GREATEST(r.departure_city, r.arrival_city)
FROM 
	routes as r
	JOIN 
	aircrafts_data as a
	ON
	r.aircraft_code = a.aircraft_code
WHERE
	a.model ->> 'en' = 'Boeing 777-300'
-----------------------------------------------------------------------
-- 4. Выяснить, сколько рейсов выполняется из Москвы в Санкт-Петербург.
-- Вывести: город отправления, город прибытия, количество рейсов.
SELECT departure_city as "город отправления", 
	arrival_city as "город прибытия", 
	COUNT(DISTINCT routes.flight_no) as "количество рейсов"
FROM 
	routes
	JOIN
	flights
	ON routes.aircraft_code = flights.aircraft_code
WHERE 
	status = 'Departed'
	AND departure_city = 'Москва'
	AND arrival_city = 'Санкт-Петербург'
GROUP BY departure_city, arrival_city

-----------------------------------------------------------------------
-- 5. Вычислить минимальные и максимальные цены билетов на все направления.
-- Вывести: город отправления, город прибытия, максимальную стоимость билета,
-- минимальную стоимость билета.
SELECT
	r.departure_city as "город отправления",
	r.arrival_city as "город прибытия",
	MAX(t.amount) as "максимальная стоимость билета",
	MIN(t.amount) as "минимальная стоимость билета"
FROM 
		ticket_flights t
	JOIN 
		flights f
	ON(t.flight_id = f.flight_id)
	JOIN 
		routes r
	ON(f.flight_no = r.flight_no )
GROUP BY r.departure_city, r.arrival_city

-- 6. Беря за основу прошлый запрос, выяснить, вывести все направления, 
-- включая те, на которые не было продано ни одного билета.
SELECT
	r.departure_city as "город отправления",
	r.arrival_city as "город прибытия",
	COALESCE(MAX(t.amount), 0) as "максимальная стоимость билета",
	COALESCE(MIN(t.amount), 0) as "минимальная стоимость билета",
	COUNT(t.ticket_no) as counts
FROM 
		ticket_flights t
	JOIN 
		flights f
	ON(t.flight_id = f.flight_id)
	JOIN 
		routes r
	ON(f.flight_no = r.flight_no )

GROUP BY r.departure_city, r.arrival_city

Having COUNT(t.ticket_no) = 0


-- 7. Написать запрос, выводящий список городов, в которые нет рейсов из Москвы
-- a. С использованием EXISTS

SELECT
 DISTINCT a.city ->> 'ru' AS city
FROM
 airports_data a
WHERE
 NOT EXISTS (
 SELECT 1
 FROM flights f
 JOIN airports_data ai ON f.departure_airport = ai.airport_code
 WHERE
 ai.city ->> 'ru' = 'Москва' AND
 f.arrival_airport = a.airport_code
 );

 -- b. С использованием UNION, INTERSECT или EXCEPT
SELECT DISTINCT a.city ->> 'ru' AS city
FROM airports_data a
WHERE a.airport_code NOT IN (
 SELECT f.arrival_airport
 FROM flights f
 JOIN airports_data ai ON f.departure_airport = ai.airport_code
 WHERE ai.city ->> 'ru' = 'Москва'
)
UNION
SELECT DISTINCT a.city ->> 'ru' AS city
FROM airports_data a
WHERE a.airport_code NOT IN (
 SELECT f.departure_airport
 FROM flights f
 JOIN airports_data ai ON f.arrival_airport = ai.airport_code
 WHERE ai.city ->> 'ru' = 'Москва'
);

--8. Написать запрос для получения перечня аэропортов в тех городах, в которых больше
-- одного аэропорта
SELECT
	f.count,
	f.city,
	aa.airport_code,
	aa.airport_name ->>'ru'
FROM(
	SELECT
		COUNT(DISTINCT a.airport_code) AS count,
		a.city->>'ru' AS city
	FROM
	 	airports_data a
	GROUP BY a.city->>'ru'
	ORDER BY count DESC
	) as f
	JOIN
		airports_data aa
	ON(aa.city->>'ru' = f.city)
WHERE f.count > 1

SELECT DISTINCT a.city ->> 'ru' AS city
FROM airports_data a
WHERE a.airport_code NOT IN (
 SELECT f.arrival_airport
 FROM flights f
 JOIN airports_data ai ON f.departure_airport = ai.airport_code
 WHERE ai.city ->> 'ru' = 'Москва'
)
UNION
SELECT DISTINCT a.city ->> 'ru' AS city
FROM airports_data a
WHERE a.airport_code NOT IN (
 SELECT f.departure_airport
 FROM flights f
 JOIN airports_data ai ON f.arrival_airport = ai.airport_code
 WHERE ai.city ->> 'ru' = 'Москва'
);

-- 9. При планировании новых маршрутов и оценке экономической эффективности уже
-- существующих может потребоваться информация о том, какова усредненная степень
-- заполнения самолетов на всех направлениях.
-- Учитывать будем только прибывшие рейсы
-- Запрос, который дан:
