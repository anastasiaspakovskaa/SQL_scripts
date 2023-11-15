use Ucheb_06_Shpakouskaya

--1) Вывести ФИО, специализацию и дату рождения всех студентов
SELECT FIO, spez, Data
FROM Student

--2) Создать вычисляемое поле «О поступлении», которое содержит информацию о
--студентах в виде: «Петров Петр Петрович поступил в 2018».
SELECT FIO + N' поступил в' + str(godpost)
AS N'О поступлении'
FROM Student;

--3) Вывести ФИО студентов и вычисляемое поле «Через 5 лет после поступления».
SELECT FIO, 
		godpost + 5 AS N'Через 5 лет после поступления'
FROM Student;

--4) Вывести список годов поступления, убрав дубликаты.
SELECT DISTINCT godpost
FROM Student;

--5) Вывести список студентов, отсортированный по убыванию даты рождения.
SELECT *
FROM Student
ORDER BY godpost DESC;

--6) Вывести список студентов, отсортированный в обратном алфавитном порядке
--специализаций, по убыванию года поступления, и в алфавитном порядке ФИО.
SELECT *
FROM Student
ORDER BY spez DESC, godpost DESC, FIO ASC;

--7) Вывести первую строку из списка студентов, отсортированного в обратном
--алфавитном порядке ФИО.
SELECT TOP 1 * 
FROM Student
ORDER BY FIO DESC;

--8) Вывести фамилию студента, который раньше всех поступил.
SELECT TOP 1 FIO
FROM Student
ORDER BY godpost;

--9) Вывести первые 10% строк из списка студентов, отсортированного в алфавитном
--порядке ФИО.
SELECT TOP 10 PERCENT *
FROM Student
ORDER BY FIO;

--10) Вывести из таблицы «Студенты», отсортированной по возрастанию года
--поступления, список студентов, у которых год поступления – один из первых пяти в
--отсортированной таблице.
SELECT TOP 5 WITH TIES *
FROM Student
ORDER BY godpost;

--11) Вывести, начиная с пятого, список студентов, отсортированный по возрастанию
--даты рождения.
SELECT *
FROM Student
ORDER BY Data
OFFSET 4 ROWS;

--12) Вывести 7 строку из списка студентов, отсортированного в алфавитном порядке
--ФИО.
SELECT *
FROM Student
ORDER BY FIO
OFFSET 6 ROWS
FETCH NEXT 1 ROWS ONLY;

--13) Вывести с 5 по 9 строки из списка студентов, отсортированного в алфавитном
--порядке ФИО.
SELECT *
FROM Student
ORDER BY FIO
OFFSET 4 ROWS
FETCH NEXT 5 ROWS ONLY;