-- Вывести имена пассажиров, которые хотя бы раз летали классом "Эконом"
SELECT passenger_name FROM tickets
WHERE EXISTS
(SELECT * FROM ticket_flights 
	WHERE tickets.ticket_no = ticket_flights.ticket_no AND fare_conditions = 'Economy')
GROUP BY passenger_name
LIMIT 1000

-- Вычислить среднее запланированное время полета
SELECT AVG(DATE_PART('day', scheduled_arrival - scheduled_departure) * 24 + 
		DATE_PART('hour', scheduled_arrival - scheduled_departure)) FROM flights

-- Вычислить минимальную стоимость билета
SELECT MIN(amount) FROM ticket_flights

-- Вычислить количество бронирований, в которое входит пассажир "ILYA PAVLOV"
SELECT COUNT(DISTINCT book_ref) FROM tickets WHERE passenger_name = 'ILYA PAVLOV'

-- Вывести все даты, в которые из аэропорта SVO запланированы отлеты/прилеты (одним столбцом)
SELECT scheduled_departure::date FROM flights WHERE departure_airport = 'SVO' AND scheduled_departure IS NOT NULL
UNION 
SELECT scheduled_arrival::date FROM flights WHERE arrival_airport = 'SVO' AND scheduled_arrival IS NOT NULL

