-- Order By -> Sıralıyor
-- DESC koyarsan tersten sıralıyor
SELECT * FROM Products Order By UnitPrice DESC;

-- CompanyName Fr ile başlayanları getir
SELECT* FROM Customers WHERE CompanyName LIKE 'Fr%';

-- CompanyName in içinde Fr olanları getir
SELECT* FROM Customers WHERE CompanyName LIKE '%Fr%';

SELECT * FROM Customers WHERE City LIKE 'on%'; -- on ile başlayanları getir
SELECT * FROM Customers WHERE City LIKE '%on'; -- on ile bitenleri getir
SELECT * FROM Customers WHERE City LIKE '%on%'; -- içinde on olanları getir

SELECT * FROM Products WHERE ProductName = 'Chai';

SELECT * FROM Products WHERE SupplierID = 1 and CategoryID = 6; -- SupplierID 1 VE CategoryID 6 olsun
SELECT * FROM Products WHERE SupplierID = 1 or CategoryID = 6; -- SupplierID 1 YA DA CategoryID 6 olsun

SELECT * FROM Products Order By UnitsInStock; -- UnitsInStock'a göre sıraladım (azalandan artana)

SELECT MIN(UnitsOnOrder) AS MaksimumSiparis FROM Products;
SELECT MAX(UnitsOnOrder) AS MinimumSiparis FROM Products;
SELECT AVG(UnitsOnOrder) AS SiparisOrtalamasi FROM Products;