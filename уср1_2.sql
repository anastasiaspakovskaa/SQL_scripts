use Ucheb_06_Shpakouskaya

SELECT
	N'Количество' AS [Количество учеников по предметам]
	,Математика
	,Физика
	,Химия
FROM 
		(
			SELECT predmet, fio
			FROM Table_uch1
		)
		AS SOURCE_TABLE
		PIVOT
		(
			COUNT(fio)
			FOR predmet IN (Математика, Физика, Химия)
		) AS PIVOT_TABLE


SELECT
	ush
	,Математика
	,Физика
	,Химия
FROM 
		(
			SELECT ush, predmet, fio
			FROM Table_uch1
		)
		AS SOURCE_TABLE
		PIVOT
		(
			COUNT(fio)
			FOR predmet IN (Математика, Физика, Химия)
		) AS PIVOT_TABLE


SELECT fio, [Предмет или школа]
FROM Table_uch1
UNPIVOT (
	[Предмет или школа] FOR Значение IN (ush, predmet) ) unpvt