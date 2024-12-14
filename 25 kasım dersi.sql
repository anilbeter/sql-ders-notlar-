SELECT * FROM Products INNER JOIN Categories on Products.CategoryID=Categories.CategoryID 
WHERE Products.UnitsInStock < 10;

-- Order Details ve Products tablolarını birleştir, 
-- 2 satırın birleşme koşulu ikisinin de ProductID si eşitse o satırları birleştir
-- Order Details (od)'nin unit price'ları 50den büyükse onları al ve birleştir
-- Şu an küçükten büyüğe sıralar, DESC yazsaydım büyükten küçüğe sıralıyor
SELECT * FROM [Order Details] od INNER JOIN Products p on od.ProductID=p.ProductID 
WHERE od.UnitPrice>50 ORDER BY od.UnitPrice;


-- Order Details tablosu yerine artık od yazıcam, kısaltma
-- Categories c yazsaydım Categories.CategoryID yerine c.CategoryID yazacaktım



SELECT OrderID, p.ProductID, ProductName, CategoryName FROM [Order Details] od 
INNER JOIN Products p on od.ProductID=p.ProductID 
INNER JOIN Categories on Categories.CategoryID = p.CategoryID;

SELECT OrderID, LastName FROM Employees e
INNER JOIN Orders o on e.EmployeeID = o.EmployeeID;

SELECT * FROM [Order Details] od RIGHT JOIN Products p on od.ProductID = p.ProductID
WHERE od.ProductID is NULL

-- Hiçbir müşteri sipariş versin istemiyoruz, Customers null olacak joinin sağında kaldığı için
-- Right -> sağ olduğu için Right join
SELECT * FROM Orders o RIGHT JOIN Customers c on o.CustomerID = c.CustomerID WHERE o.CustomerID is NULL


-- Customers bu kez solda kaldığı için LEFT JOIN
SELECT * FROM Customers c LEFT JOIN Orders o on o.CustomerID = c.CustomerID WHERE o.CustomerID is NULL

SELECT * FROM Employees e LEFT JOIN Orders o on o.EmployeeID = o.EmployeeID WHERE o.EmployeeID IS NULL