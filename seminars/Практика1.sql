-- 1. Из таблицы tickets выбрать все записи для пассажиров 
--		с именем POLINA или с именем ANTON (1 б)
SELECT * FROM Tickets 
WHERE passenger_name LIKE 'ALINA %' 
	OR passenger_name LIKE 'ANTON %'

-- 2. Вывести все записи из таблицы flights для всех совершенных
--		полетов из аэропорта DME в аэропорт ROV (1 б) 
SELECT * FROM Flights 
WHERE departure_airport = 'DME' 
	AND arrival_airport = 'ROV'

-- 3. Вывести все ticket_no из таблицы ticket_flights, стоимость 
--		которых находится в диапазоне от 10000 до 15000 (1 б)
-- (если я правильно понял, то границы диапазона нужно учитывать)
SELECT ticket_no FROM ticket_flights 
WHERE amount BETWEEN 10000 AND 15000

-- 4. Вывести все записи из таблицы flights для полетов, 
--		запланированная продолжительность которых меньше часа (2 б)

SELECT * FROM Flights 
WHERE DATE_PART('day', scheduled_arrival - scheduled_departure) * 24 + 
		DATE_PART('hour', scheduled_arrival - scheduled_departure) < 1

