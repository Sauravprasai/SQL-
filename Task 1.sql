Print '
Assignment 2 - Date 2023-02-11

Group 4
Sanjeev Bindukar - 200505358
Sakchhyat Bhandari - 200495842
Mohit Mohit - 200456051
Saurav Prasai - 200495782

**************************************************************
'
PRINT '
USE AdventureWorks2019;
'
USE AdventureWorks2019;


PRINT '
#1
SELECT COUNT(DISTINCT ProductID)
FROM Purchasing.PurchaseOrderDetail
'
SELECT COUNT(DISTINCT ProductID)
FROM Purchasing.PurchaseOrderDetail

PRINT '
#2
SELECT TOP 3 ProductID, SUM(OrderQty*UnitPrice) as TotalRevenue
FROM Purchasing.PurchaseOrderDetail
GROUP BY ProductID
ORDER BY TotalRevenue DESC;

•  Can we use line total instead of considering the price and order quantity?
-> Yes, I tried using line total as TotalRevenue and it gives the same result as using SUM().
'
SELECT TOP 3 ProductID, SUM(OrderQty*UnitPrice) as TotalRevenue
FROM Purchasing.PurchaseOrderDetail
GROUP BY ProductID
ORDER BY TotalRevenue DESC;

PRINT '
#3
SELECT TOP 5 PP.name, SUM(PO.OrderQty*PO.UnitPrice) as TotalRevenue
FROM Purchasing.PurchaseOrderDetail as PO 
join Production.Product as PP
ON PP.ProductID = PO.ProductID
GROUP BY PP.Name
ORDER BY TotalRevenue DESC;
'
SELECT TOP 5 PP.name, SUM(PO.OrderQty*PO.UnitPrice) as TotalRevenue
FROM Purchasing.PurchaseOrderDetail as PO 
join Production.Product as PP
ON PP.ProductID = PO.ProductID
GROUP BY PP.Name
ORDER BY TotalRevenue DESC;

PRINT'
#4
SELECT COUNT(ProductID) as MoreThanAverageStockQTY
FROM Purchasing.PurchaseOrderDetail
WHERE StockedQty > (SELECT AVG(stockedqty)
					FROM Purchasing.PurchaseOrderDetail)
'

SELECT COUNT(ProductID) as MoreThanAverageStockQTY
FROM Purchasing.PurchaseOrderDetail
WHERE StockedQty > (SELECT AVG(stockedqty)
					FROM Purchasing.PurchaseOrderDetail)

PRINT '
#5
SELECT SP.ProductID, SS.ModifiedDate
FROM Sales.SpecialOfferProduct as SP 
JOIN Sales.SpecialOffer as SS
ON SP.SpecialOfferID = SS.SpecialOfferID
WHERE SS.Description like "Half-Price Pedal Sale";
'
SELECT SP.ProductID, SS.ModifiedDate
FROM Sales.SpecialOfferProduct as SP 
JOIN Sales.SpecialOffer as SS
ON SP.SpecialOfferID = SS.SpecialOfferID
WHERE SS.Description like 'Half-Price Pedal Sale';

PRINT'
#6
SELECT PP.ProductID, PP.Name, PO.PurchaseOrderDetailID
FROM Production.Product as PP 
left join Purchasing.PurchaseOrderDetail as PO
ON PO.ProductID = PP.ProductID
WHERE PP.Name like "%seat Assembly%" and PO.PurchaseOrderDetailID is null
ORDER BY ProductID;
'
SELECT PP.ProductID, PP.Name, PO.PurchaseOrderDetailID
FROM Production.Product as PP 
left join Purchasing.PurchaseOrderDetail as PO
ON PO.ProductID = PP.ProductID
WHERE PP.Name like '%seat Assembly%' and PO.PurchaseOrderDetailID is null
ORDER BY ProductID;


PRINT'
#7
WITH SalesOrders AS (SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear
					FROM Sales.SalesOrderHeader
					WHERE SalesPersonID IS NOT NULL)
SELECT SalesPersonID, SalesYear, COUNT(SalesOrderID) AS TotalOrders
FROM SalesOrders
GROUP BY SalesPersonID,SalesYear
ORDER BY SalesPersonID, SalesYear

';

WITH SalesOrders as (SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear FROM Sales.SalesOrderHeader WHERE SalesPersonID IS NOT NULL)
SELECT SalesPersonID, SalesYear, COUNT(SalesOrderID) AS TotalOrders
FROM SalesOrders
GROUP BY SalesPersonID,SalesYear
ORDER BY SalesPersonID, SalesYear;

PRINT'
#8
SELECT TOP 5 ProductID, SUM(StockedQty) as TotalStockedQty
FROM Purchasing.PurchaseOrderDetail
GROUP BY ProductID
ORDER BY TotalStockedQty DESC
'
SELECT TOP 5 ProductID, SUM(StockedQty) as TotalStockedQty
FROM Purchasing.PurchaseOrderDetail
GROUP BY ProductID
ORDER BY TotalStockedQty DESC;

PRINT'
#9
SELECT PC.ProductID, PC.StandardCost AS StandardCostHistory,
					 PC.ModifiedDate AS ModifiedDateHistory,
					 PP.StandardCost AS StandardCostProduct,
					 PP.ModifiedDate AS ModifiedDateProduct
FROM Production.ProductCostHistory PC
JOIN Production.Product PP 
ON PC.ProductID = PP.ProductID
WHERE PC.ModifiedDate != PP.ModifiedDate;
'

SELECT PC.ProductID, PC.StandardCost AS StandardCostHistory,
					 PC.ModifiedDate AS ModifiedDateHistory,
					 PP.StandardCost AS StandardCostProduct,
					 PP.ModifiedDate AS ModifiedDateProduct
FROM Production.ProductCostHistory PC
JOIN Production.Product PP 
ON PC.ProductID = PP.ProductID
WHERE PC.ModifiedDate != PP.ModifiedDate;

