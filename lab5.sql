use uni


SELECT 
	S.Fio_stud,
	P.NaprSpez,
	K.NKaf AS Kafedra
FROM Student S
		INNER JOIN Spezialn P ON S.Nom_SpeZ_St = P.Nspez
		INNER JOIN Kafedra K ON P.Shifr_Spez = K.ShifrKaf
WHERE K.AbFaK_Kaf = N'ит'


SELECT 
	S.FIO, 
	S.Dolgn,
	CASE 
		WHEN S.Dolgn != N'зав. каф' THEN P.FIO
			ELSE NULL 
				END 
		AS Руководитель,
	CASE 
		WHEN S.Dolgn != N'зав. каф' THEN P.TabNom 
			ELSE NULL 
				END
		AS [Номер руководителя]
FROM Sotrudnik S
INNER JOIN Sotrudnik P ON S.TabNom_ruk = P.TabNom


SELECT S.Fio_stud, COUNT(*) AS exam_num
FROM Student S
LEFT OUTER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
GROUP BY S.Fio_stud
HAVING COUNT(*) >= 2


SELECT 
	S.FIO, 
	S.Zarplata
FROM Sotrudnik S
INNER JOIN Ingener I ON S.TabNom = I.TabNom_IN
WHERE S.Zarplata < 2000


SELECT DISTINCT S.Fio_stud
FROM Student S
LEFT OUTER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
WHERE O.Auditoria = N'т505'


SELECT  
		S.Fio_stud, 
		S.Reg_Nom,
		COUNT(*) AS exam_num,
		AVG(O.Ozenk_a) AS avg_ozenka
FROM Student S
LEFT OUTER JOIN Ozenka O ON S.Reg_Nom = O.ReGNom
GROUP BY S.Fio_stud, S.Reg_Nom
HAVING AVG(O.Ozenk_a) >= 4