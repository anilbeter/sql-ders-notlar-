USE Northwind

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
FROM [Products]
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

SELECT COUNT(*) AS [Ürün Sayısı]
FROM Products
-- Ürünleri sayıyor, 77 tane ürün varmış 

SELECT COUNT(ProductName)
FROM Products
-- Yukarıdaki kodla aynı mantık, 77 verim varsa 77sininde ProductName'i olduğu için 77 tane product name olacak

SELECT *
FROM Products

SELECT LEFT (ProductName, 2) AS [ürün kısaltma]
FROM Products
-- ProductName'in ilk 2 harfini getir

SELECT RIGHT (ProductName, 2) AS [ürün kısaltma]
FROM Products
-- ProductName'in son 2 harfini getir

SELECT ProductName
FROM [Order Details] INNER JOIN Products ON Products.ProductID  = [Order Details].ProductID

-- INNER JOIN ORNEK
SELECT c.ContactName, p.ProductName, ct.CategoryName
FROM customers c INNER JOIN Orders o ON c.CustomerID=o.CustomerID INNER JOIN [Order Details] od on od.OrderID=o.OrderID
  INNER JOIN Products p on p.ProductID=od.ProductID
  INNER JOIN Categories ct on ct.CategoryID = p.CategoryID

-- DISCTINC, GROUP BY, HAVING

SELECT DISTINCT City
From Customers
-- Tekrar eden şehirleri silerek şehirleri getir

-- GROUP BY
SELECT City, Count(*) AS 'Number of Customer'
FROM Customers
GROUP BY City

-- HAVING
-- GROUP BY varsa HAVING, WHERE ile aynı işleve sahip, HAVING ile de koşul yazıyorum
-- HAVING ISIM = "ANIL" gibi --> ismi Anıl olanları getir
SELECT EmployeeID, Count(*) AS 'Siparis sayisi'
FROM Orders
GROUP BY EmployeeID
HAVING EmployeeID = 5
ORDER BY EmployeeID

-- Her bir ürünün ne kadar satıldığını gösteriyor
SELECT od.ProductID, p.ProductName, COUNT(*) as [Satış Adedi]
FROM [Order Details] od INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID, p.ProductName

-- 9.12.2024
-- 5'Lİ TABLO BİRLEŞTİRME
SELECT c.CategoryName, ContactName, ProductName, c.CategoryID
FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID INNER JOIN [Order Details] od ON od.ProductID = p.ProductID INNER JOIN Orders o ON o.OrderID = od.OrderID
  INNER JOIN Customers ct ON ct.CustomerID = o.CustomerID


-- INNER JOIN VE GROUP BY BİR ARADA ÖRNEK
SELECT CategoryName, COUNT(*) AS 'Satış Miktarı'
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
  INNER JOIN [Order Details] ON [Order Details].[ProductID] = Products.ProductID
GROUP BY Categories.CategoryName
HAVING COUNT(*) < 200