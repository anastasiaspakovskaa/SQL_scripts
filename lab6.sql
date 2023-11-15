use ucheb

SELECT Nazvanie, Stolica, PL, KolNas, Kontinent,
		ROUND(CAST(KolNas AS FLOAT) * 100 / 
		(
			SELECT SUM(KolNas)
			FROM Tabl_Kontinent$
		), 3) AS Procent
FROM Tabl_Kontinent$
ORDER BY Procent DESC


SELECT *
FROM Tabl_Kontinent$
WHERE KolNas > (SELECT AVG(KolNas) FROM Tabl_Kontinent$)

SELECT *
FROM (
		SELECT *
		FROM Tabl_Kontinent$
		WHERE Nazvanie = N'Африка'
	) A
WHERE KolNas > 50000000


SELECT Nazvanie, Stolica, PL, KolNas, Kontinent,
		ROUND(CAST(KolNas AS FLOAT) * 100 /
			(
				SELECT SUM(KolNas)
				FROM Tabl_Kontinent$ B
				WHERE A.Kontinent = B.Kontinent
			), 3) AS Procent
FROM Tabl_Kontinent$ A
ORDER BY Procent DESC


SELECT *
FROM Tabl_Kontinent$ A
WHERE KolNas > (
					SELECT AVG(KolNas)
					FROM Tabl_Kontinent$ B
					WHERE B.Kontinent = A.Kontinent
				)


SELECT *
FROM Tabl_Kontinent$
WHERE Kontinent IN(
					SELECT Kontinent
					FROM Tabl_Kontinent$
					GROUP BY Kontinent
					HAVING AVG(KolNas) > (
											SELECT AVG(KolNas)
											FROM Tabl_Kontinent$
										)
					)


SELECT *
FROM Tabl_Kontinent$
WHERE Kontinent = N'Азия'
	AND
	KolNas > ALL(
		SELECT KolNas
		FROM Tabl_Kontinent$
		WHERE Kontinent = N'Европа'
		)


SELECT *
FROM Tabl_Kontinent$ 
WHERE Kontinent = N'Европа'
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
			KolNas > 100000000
		)


SELECT *
FROM Tabl_Kontinent$
WHERE Kontinent = (
				SELECT Kontinent
				FROM Tabl_Kontinent$
				WHERE Nazvanie = N'Ангола'
				)


SELECT *
FROM Tabl_Kontinent$
WHERE KolNas !> (
				SELECT KolNas
				FROM Tabl_Kontinent$
				WHERE Nazvanie = N'Ангола'
				)


SELECT *
FROM Tabl_Kontinent$
WHERE KolNas = (
				SELECT MAX(Min_Nas)
				FROM (
						SELECT MIN(KolNas) AS Min_Nas
				FROM Tabl_Kontinent$
				GROUP BY Kontinent
				) A
			)