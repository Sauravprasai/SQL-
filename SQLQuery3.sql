SELECT * FROM Production.Product;

SELECT COUNT (Distinct Color)
FROM Production.Product 
WHERE Color is not null;

SELECT AVG(ListPrice) as Average,
	   SUM(ListPrice) as Total,
	   MIN(ListPrice) as Minimun,
	   MAX(ListPrice) as Maximum,
	   COUNT(ListPrice) as TotalCount
FROM Production.Product

SELECT Color, avg(listprice
FROM Production.Product
where color = 'black'
group by color ;

SELECT top 1 color, avg(listprice)
FROM Production.Product
WHERE COLOR IS NOT NULL
GROUP BY color
order by 2

SELECT TOP 1 color, avg(listprice)
FROM Production.Product
GROUP BY Color
HAVING COLOR like '%r%'




