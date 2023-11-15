use Ucheb_06_Shpakouskaya

--1. Напишите запрос, который выводит максимальный балл учеников по 
--школам, по каждому предмету по каждой школе и промежуточные итоги. 
SELECT predmet, ush, MAX(ball) AS max_ball
FROM Table_uch1
GROUP BY predmet, ush WITH ROLLUP

--2. Напишите запрос, который выводит минимальный балл учеников по школам 
--и по предметам, и промежуточные итоги. 
SELECT predmet, ush, MIN(ball) AS min_ball
FROM Table_uch1
GROUP BY predmet, ush WITH ROLLUP

--3. Напишите запрос, который выводит средний балл учеников по школам и по 
--предметам. 
SELECT predmet, ush, ROUND(AVG(ball), 2) AS avg_ball
FROM Table_uch1
GROUP BY predmet, ush

--4. Напишите запрос, который выводит количество учеников по каждой школе 
--по предметам и промежуточные итоги. NULL значения заменить на соответствующий 
--текст. 
SELECT 
		COALESCE(predmet, N'ИТОГО') AS predmet
		,COALESCE(ush, N'Итого') AS ush
		,COUNT(fio) AS stud_num
FROM Table_uch1
GROUP BY ROLLUP(predmet, ush)

--5. Напишите запрос, который выводит суммарный балл учеников по школам и 
--по предметам, и промежуточные итоги. В итоговых строках NULL значения заменить на 
--соответствующий текст в зависимости от группировки. 
SELECT 
		IIF(GROUPING(predmet)=1, N'ИТОГО', predmet) AS predmet
		,IIF(GROUPING(ush)=1, N'Итого', ush) AS ush
		,SUM(ball) AS ball_sum
FROM Table_uch1
GROUP BY CUBE(predmet, ush)

--6. Напишите запрос, который выводит максимальный балл учеников по школам 
--и по предметам. В итоговых строках NULL значения заменить на соответствующий текст 
--в зависимости от уровней группировки.
SELECT 
	CASE GROUPING_ID(predmet, ush)
		WHEN 1 THEN N'Итого по предметам'
		WHEN 3 THEN N'Итого'
		ELSE ''
	END AS Итого
	,ISNULL(predmet, '') AS predmet
	,ISNULL(ush, '') AS ush
	,MAX(ball) AS max_ball
FROM Table_uch1
GROUP BY ROLLUP(predmet, ush)