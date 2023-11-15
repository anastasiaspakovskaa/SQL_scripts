use ucheb

SELECT Nazvanie, Stolica, PL, KolNas, Kontinent,
		ROUND(CAST(PL AS FLOAT) * 100 / 
		(
			SELECT SUM(PL)
			FROM Tabl_Kontinent$
		), 3) AS Procent
FROM Tabl_Kontinent$
ORDER BY Procent DESC



SELECT *
FROM Tabl_Kontinent$
WHERE KolNas / PL > (SELECT AVG(KolNas / PL) FROM Tabl_Kontinent$)



SELECT *
FROM (
		SELECT *
		FROM Tabl_Kontinent$
		WHERE Kontinent = N'Европа'
	) A
WHERE KolNas < 5000000


SELECT Nazvanie, Stolica, PL, KolNas, Kontinent,
		ROUND(CAST(PL AS FLOAT) * 100 /
			(
				SELECT SUM(PL)
				FROM Tabl_Kontinent$ B
				WHERE A.Kontinent = B.Kontinent
			), 3) AS Procent
FROM Tabl_Kontinent$ A
ORDER BY Procent DESC


SELECT *
FROM Tabl_Kontinent$ A
WHERE PL > (
					SELECT AVG(PL)
					FROM Tabl_Kontinent$ B
					WHERE B.Kontinent = A.Kontinent
				)


SELECT *
FROM Tabl_Kontinent$
WHERE Kontinent IN(
					SELECT Kontinent
					FROM Tabl_Kontinent$
					GROUP BY Kontinent
					HAVING AVG(KolNas / PL) > (
											SELECT AVG(KolNas / PL)
											FROM Tabl_Kontinent$
										)
					)


SELECT *
FROM Tabl_Kontinent$
WHERE Kontinent = N'Южная Америка'
	AND
	KolNas > ALL(
		SELECT KolNas
		FROM Tabl_Kontinent$
		WHERE Kontinent = N'Африка'
		)


SELECT *
FROM Tabl_Kontinent$ 
WHERE Kontinent = N'Африка'
	AND
	KolNas > ANY(
		SELECT KolNas
		FROM Tabl_Kontinent$
		WHERE Kontinent = N'Южная Америка'
		)


SELECT *
FROM Tabl_Kontinent$
WHERE Kontinent = N'Африка'
	AND
	EXISTS(
			SELECT *
			FROM Tabl_Kontinent$
			WHERE Kontinent = N'Африка'
			AND
			PL > 2000000
		)


SELECT *
FROM Tabl_Kontinent$
WHERE Kontinent = (
				SELECT Kontinent
				FROM Tabl_Kontinent$
				WHERE Nazvanie = N'Фиджи'
				)


SELECT *
FROM Tabl_Kontinent$
WHERE KolNas !> (
				SELECT KolNas
				FROM Tabl_Kontinent$
				WHERE Nazvanie = N'Фиджи'
				)


SELECT *
FROM Tabl_Kontinent$
WHERE KolNas = (
				SELECT MAX(KolNas)
				FROM (
						SELECT *
						FROM Tabl_Kontinent$
						WHERE PL = (SELECT MIN(PL) FROM Tabl_Kontinent$)
					) A
				)