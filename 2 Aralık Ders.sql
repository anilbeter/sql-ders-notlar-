SELECT *
FROM Products

SELECT ProductID as ID, ProductName as name
from Products

SELECT p.ProductName, p.UnitsInStock*p.UnitPrice as TOTAL
FROM Products p

SELECT 5*5

SELECT CONCAT('Anil', ' ', 'Beter') as fullName
-- Anil Beter

SELECT p.ProductName
FROM Products p
WHERE p.UnitsInStock = 0 AND p.UnitsOnOrder > 0
-- Products tablosunu p olarak kaydettim(Products == p), p tablosundan stocku 0 solan ve orderı 0 dan büyük olan productsname(ler) i getir

SELECT *
FROM Products
WHERE UnitsInStock = 0 OR UnitsOnOrder = 0

SELECT *
FROM Products
ORDER BY UnitPrice asc, ProductName DESC

SELECT *
FROM Products
WHERE UnitPrice BETWEEN 15 AND 25
ORDER BY UnitPrice

SELECT *
FROM Products
WHERE CategoryID in (1,2)
-- CategoryID 1 ve 2 olanları getir