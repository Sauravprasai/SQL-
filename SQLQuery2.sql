SELECT InvoiceTotal FROM Invoices;

SELECT AVG(InvoiceTotal) as 'averageofinvoices' FROM Invoices;

SELECT InvoiceTotal 
FROM Invoices 
WHERE InvoiceTotal> (SELECT AVG(InvoiceTotal) 
					 FROM Invoices);

SELECT InvoiceNumber, InvoiceDate, VendorID
from Invoices
WHERE VendorID in (SELECT VendorID FROM Vendors
				WHERE VendorState = 'CA');


SELECT i.InvoiceNumber,i.InvoiceDate, v.VendorID
FROM Invoices as i JOIN Vendors as v
ON i.VendorID = v.VendorID  and VendorState = 'CA';


SELECT VendorName
FROM Vendors
WHERE VendorID not in (SELECT VendorID FROM Invoices)


SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Invoices JOIN Vendors
ON Invoices.VendorID = Vendors.VendorID
WHERE InvoiceTotal > ANY
    (SELECT InvoiceTotal
    FROM Invoices
    WHERE VendorID = 34)
ORDER BY VendorName;
