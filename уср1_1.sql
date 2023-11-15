use Ucheb_06_Shpakouskaya

SELECT predmet, ush, COUNT(fio) AS kol
FROM Table_uch1
GROUP BY predmet, ush

SELECT predmet, ush, COUNT(fio) AS kol
FROM Table_uch1
GROUP BY predmet, ush WITH ROLLUP

SELECT predmet, ush, COUNT(fio) AS kol
FROM Table_uch1
GROUP BY predmet, ush WITH CUBE

SELECT predmet, ush, COUNT(fio) AS kol
FROM Table_uch1
GROUP BY GROUPING SETS(predmet, ush)

SELECT 
		COALESCE(predmet, N'ИТОГО') AS predmet
		, COALESCE(ush, N'Итого') AS ush
		, COUNT (fio) AS kol
FROM Table_uch1
GROUP BY ROLLUP(predmet, ush)

SELECT 
		IIF(GROUPING(predmet)=1, N'ИТОГО', predmet) AS predmet
		, IIF(GROUPING(ush)=1, N'Итого', ush) AS ush
		, COUNT(fio) AS kol
FROM Table_uch1
GROUP BY CUBE ( predmet, ush)

SELECT 
	CASE GROUPING_ID(predmet, ush)
		WHEN 1 THEN N'Итого по предметам'
		WHEN 3 THEN N'Итого'
		ELSE ''
	END AS Итого
	, ISNULL(predmet, '') AS predmet
	, ISNULL(ush, '') AS ush
	, COUNT(fio) AS kol
FROM Table_uch1
GROUP BY ROLLUP(predmet, ush)