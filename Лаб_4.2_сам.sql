use AdventureWorksDW2019

SELECT * FROM DimGeography

SELECT
City + ' (' + CountryRegionCode + ')' AS 'City(code)',
IpAddressLocator
FROM DimGeography;

SELECT
City + ' (' + CountryRegionCode + ')' AS 'City(code)',
IpAddressLocator
INTO CityIpAddresses
FROM DimGeography;

SELECT *
FROM CityIpAddresses;

SELECT
City,
StateProvinceName + ' (' + StateProvinceCode + ')' AS 'Province(code)'
FROM DimGeography
ORDER BY 'Province(code)';

SELECT 
	City, 
	EnglishCountryRegionName 
FROM DimGeography
ORDER BY EnglishCountryRegionName + City;