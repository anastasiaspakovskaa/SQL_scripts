use ucheb

SELECT 
		Nazvanie
		,Stolica
		,PL
		,KolNas
		,Kontinent
FROM Tabl_Kontinent$
WHERE PL > 1000000
UNION
SELECT 
		Nazvanie
		,Stolica
		,PL
		,KolNas
		,Kontinent
FROM Tabl_Kontinent$
WHERE KolNas > 100000000


SELECT 
		Nazvanie
		,Stolica
		,PL
		,KolNas
		,Kontinent
FROM Tabl_Kontinent$
WHERE PL > 1000000
UNION ALL
SELECT 
		Nazvanie
		,Stolica
		,PL
		,KolNas
		,Kontinent
FROM Tabl_Kontinent$
WHERE KolNas > 100000000


SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = N'Европа' AND
	CAST(KolNas AS FLOAT) / PL > 400
UNION 
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = N'Азия' AND
	CAST(KolNas AS FLOAT) / PL > 300
UNION
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE Kontinent = N'Африка' AND
	CAST(KolNas AS FLOAT) / PL > 200
ORDER BY Kontinent


SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE PL > 1000000
EXCEPT
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE KolNas > 1000000


SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE PL > 1000000
INTERSECT
SELECT Nazvanie, Stolica, PL, KolNas, Kontinent
FROM Tabl_Kontinent$
WHERE KolNas > 100000000


SELECT *
FROM Tabl_Kontinent$
WHERE PL < 500
UNION 
SELECT *
FROM Tabl_Kontinent$
WHERE PL > 5000000


SELECT *
FROM Tabl_Kontinent$
WHERE PL > 1000000
EXCEPT
SELECT * 
FROM Tabl_Kontinent$
WHERE KolNas < 100000000


SELECT *
FROM Tabl_Kontinent$
WHERE PL < 500
INTERSECT
SELECT * 
FROM Tabl_Kontinent$
WHERE KolNas < 100000

SELECT * FROM Tabl_Kontinent$