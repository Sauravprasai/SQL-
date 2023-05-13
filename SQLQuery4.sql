with gurmanTable_CTE(BE,FN,LN)
AS 
(SELECT BusinessEntityID, FirstName, LastName
from Person.Person)

select BN, FN, LN
from gurmanTable_CTE
Where LN like '%gu%'