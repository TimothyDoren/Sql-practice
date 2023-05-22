Select Customers.name AS Customers 
From Customers
Left Join Orders ON Customers.id = Orders.customerId
Where Orders.customerId IS NULL;

--SQL Querry where it returns customers who never order 