use Ucheb_06_Shpakouskaya

--17. Вывести минимальную площадь стран.
SELECT MIN(PL) AS max_PL 
FROM Tabl_Kontinent$;

--18. Вывести наибольшую по населению страну в Северной и Южной Америке.
SELECT TOP 1 * 
FROM Tabl_Kontinent$
WHERE Kontinent In (N'Южная Америка', N'Северная Америка')
ORDER BY KolNas DESC;

--19. Вывести среднее население стран. Результат округлить до одного знака.
SELECT ROUND(AVG(CAST(KolNas AS FLOAT)), 1) AS NasAvg
FROM Tabl_Kontinent$;

--20. Вывести количество стран, у которых название заканчивается на «ан», кроме стран,
--у которых название заканчивается на «стан».
SELECT COUNT(*) AS Kol
FROM Tabl_Kontinent$
WHERE RIGHT(Nazvanie, 2) = N'ан' AND RIGHT(Nazvanie, 4) != N'стан';

--21. Вывести количество континентов, где есть страны, название которых начинается с
--буквы «Р».
SELECT COUNT(DISTINCT Kontinent) AS Kol
FROM Tabl_Kontinent$
WHERE LEFT(Nazvanie, 1) = N'Р';

--22. Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей
--площадью?
SELECT MAX(PL) / MIN(PL) 
FROM Tabl_Kontinent$;

--23. Вывести количество стран с населением больше, чем 100 млн. чел. на каждом
--континенте. Результат отсортировать по количеству стран по возрастанию.
SELECT Kontinent, COUNT(Nazvanie) AS Kol
FROM Tabl_Kontinent$
WHERE KolNas > 100000000
GROUP BY Kontinent
ORDER BY Kol;

--24. Вывести количество стран по количеству букв в названии. Результат отсортировать
--по убыванию.
SELECT LEN(Nazvanie) AS Nazv_len,
		COUNT(Nazvanie) AS Kol
FROM Tabl_Kontinent$
GROUP BY LEN(Nazvanie)
ORDER BY Nazv_len DESC;

--25. Ожидается, что через 20 лет население мира вырастет на 10%. Вывести список
--континентов с прогнозируемым населением:
SELECT Kontinent, 
		SUM(KolNas) * 1.1 AS 'in 20 years'
FROM Tabl_Kontinent$
GROUP BY Kontinent;

--26. Вывести список континентов, где разница по площади между наибольшими и
--наименьшими странами не более в 10000 раз:
SELECT Kontinent
FROM Tabl_Kontinent$
GROUP BY Kontinent
HAVING MAX(PL) / MIN(PL) <= 10000;

--27. Вывести среднюю длину названий Африканских стран.
SELECT AVG(LEN(Nazvanie)) AS avg_len
FROM Tabl_Kontinent$
WHERE Kontinent=N'Африка';

--28. Вывести список континентов, у которых средняя плотность среди стран с
--населением более 1 млн. чел. больше, чем 30 чел. на кв. км.
SELECT Kontinent
FROM Tabl_Kontinent$
WHERE KolNas > 1000000
GROUP BY Kontinent
HAVING AVG(CAST(KolNas AS FLOAT) / PL) > 30;