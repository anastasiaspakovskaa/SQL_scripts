use Ucheb_06_Shpakouskaya

SELECT * FROM Products

--1) Найти все товары, производителем которых является компания Samsung
SELECT * 
FROM Products
WHERE Manufacturer='Samsung';

--2) Найти все товары, у которых цена больше 45000
SELECT *
FROM Products
WHERE Price > 45000;

--3) Найти все товары, у которых совокупная стоимость больше 200 000 ( Price *
--ProductCount > 200000)
SELECT *
FROM Products
WHERE Price * ProductCount > 200000;

--4) Выбрать все товары, у которых производитель Samsung и одновременно цена
--больше 50000
SELECT *
FROM Products
WHERE (Manufacturer='Samsung') AND (Price > 50000);

--5) Выбрать все товары, у которых либо производитель Samsung, либо цена
--больше 50000
SELECT *
FROM Products
WHERE (Manufacturer='Samsung') OR (Price > 50000);

--6) Выбрать все товары, у которых производитель не Samsung
SELECT *
FROM Products
WHERE Manufacturer != 'Samsung';

--7) Выбрать товары, которых на складе больше 2 и у которых одновременно цена
--больше 30000, либо те товары, производителем которых является Samsung.
SELECT * 
FROM Products
WHERE (ProductCount > 2) AND (Price > 30000)
	OR
		(Manufacturer='Samsung');

--8) Выбрать товары, у которых производитель либо Samsung, либо Xiaomi, либо
--Huawei.
SELECT *
FROM Products
WHERE Manufacturer In ('Samsung', 'Xiaomi', 'Huawei');

--9) Выбрать все товары, у которых цена от 20000 до 40000 (начальное и конечное
--значения также включаются в диапазон).
SELECT *
FROM Products
WHERE Price BETWEEN 20000 AND 40000;

--10) Выбрать товары, запасы которых на определенную сумму (цена *
--количество) в диапазоне 100000 - 200000
SELECT *
FROM Products
WHERE Price * ProductCount BETWEEN 100000 AND 200000;