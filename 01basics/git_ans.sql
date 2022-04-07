-- TODO: INNER JOIN
-- TODO: ques1: Get me all order id, customer name and date when order was placed

-- SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
-- FROM (Orders
-- INNER JOIN Customers 
-- ON Orders.CustomerID = Customers.CustomerID) 
-- LIMIT 5;

-- TODO: Get me order id customer name and who is the shipper for that order.

-- SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
-- FROM ((Orders
--     INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
--     INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
-- ) LIMIT 5;

-- TODO: LEFT JOIN

-- Give me all customer name with their order id
-- SELECT Customers.CustomerName, Orders.OrderID
-- FROM Customers
-- LEFT JOIN Orders 
-- ON Customers.CustomerID = Orders.CustomerID
-- LIMIT 5;

-- TODO: RIGHT JOIN

-- SELECT Customers.CustomerName, Orders.OrderID
-- FROM Customers
-- RIGHT JOIN Orders 
-- ON Customers.CustomerID = Orders.CustomerID
-- LIMIT 5;

-- TODO: FULL OUTER JOIN and 
-- TODO: UNION tasks
-- TODO: UNION ALL combine all the values duplicate value AND UNIOIN provide distinct values


