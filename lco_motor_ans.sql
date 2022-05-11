-- TODO: Q-1 How would you fetch details of the customers who cancelled orders?
SELECT customers.*
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.status = "Cancelled";



-- TODO: Q-2 Fetch the details of customers who have done payments between the amount 5000 and 35000?
SELECT customers.*, payments.amount
FROM customers
LEFT JOIN payments ON payments.customer_id = customers.customer_id
WHERE payments.amount BETWEEN 5000 AND 35000 ORDER BY payments.amount;

-- TODO: Q-4 Assign the new employee to the customer whose phone is 2125557413, set sales_employee_id to 15657
UPDATE customers SET customers.sales_employee_id = 1501 WHERE customers.phone = "2125557413";


-- TODO: Q-5 Write SQL query to fetch shipped motorcycles
SELECT orders.*
FROM orders
LEFT JOIN orderdetails ON orderdetails.order_id = orders.order_id
LEFT JOIN products ON products.product_code = orderdetails.product_code
WHERE products.product_line = "Motorcycles" AND orders.status = "Shipped";

-- TODO: Q-6 Write a SQL query to get details of all employees/salesmen in the office located in Sydney.
SELECT employees.*
FROM employees
LEFT JOIN offices ON offices.office_code = employees.office_code
WHERE offices.city = "Sydney";

-- TODO: Q-7 How would you fetch the details of customers whose orders are in process?
SELECT customers.*
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.status = "In process";


-- TODO: Q-8 How would you fetch the details of products with less than 30 oders?
SELECT products.*, productlines.product_line, productlines.description
FROM products
RIGHT JOIN productlines ON productlines.product_line = products.product_line
LEFT JOIN orderdetails ON products.product_code = orderdetails.product_code
WHERE orderdetails.quantity_ordered < 30;


-- TODO: Q-9 It is noted that the payment  (check number OM314933) was actually 2575. Update the record.
UPDATE payments SET payments.amount = "2575" WHERE payments.check_number = "OM314933"; 


-- TODO: Q-10 Fetch the details of salesmen/employees dealing with customers whose orders are resolved.
SELECT DISTINCT employees.*, orders.status
FROM employees
LEFT JOIN customers ON customers.sales_employee_id = employees.employee_id
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.status = "Resolved";

-- TODO: Q-11 Get the details of the customers who made the maximum payment.
SELECT customers.*, payments.amount
FROM customers
LEFT JOIN payments ON payments.customer_id = customers.customer_id
WHERE payments.amount = (SELECT MAX(amount) FROM payments);

-- TODO: Q-12 Fetch list of orders shipped to France.
SELECT orders.*, customers.country
FROM orders
LEFT JOIN customers ON customers.customer_id = orders.customer_id
WHERE orders.status = "Shipped" AND customers.country = "France";

-- TODO: Q-13 How many customers are from Finland who placed orders.
SELECT customers.customer_id, orders.order_id
FROM customers
RIGHT JOIN orders ON orders.customer_id = customers.customer_id
WHERE customers.country = "Finland";

-- TODO: Q-14 Get the details of the customer who made the maximum payment.
SELECT customers.*, payments.amount
FROM customers
LEFT JOIN payments ON payments.customer_id = customers.customer_id
WHERE payments.amount = (SELECT MAX(amount) FROM payments);


-- TODO: Q-15 Get the details of the customer and payments they made between May 2019 and June 2019.
SELECT customers.customer_id, customers.customer_name, payments.amount, payments.payment_date
FROM customers
LEFT JOIN payments ON payments.customer_id = customers.customer_id
WHERE payments.payment_date BETWEEN '2019-05-01' AND '2019-06-30';

-- TODO: Q-16 How many orders shipped to Belgium in 2018
SELECT COUNT(orders.order_id) 
FROM orders
INNER JOIN customers ON customers.customer_id = orders.customer_id
WHERE customers.country = "Belgium" AND 
orders.shipped_date BETWEEN "2018-01-01" AND "2018-12-31";

-- TODO: Q-17 Get the details of the salesman/employee with offices dealing with customers in Germany.
SELECT employees.*, offices.*
FROM employees
CROSS JOIN offices ON offices.office_code = employees.office_code
LEFT JOIN customers ON customers.sales_employee_id = employees.employee_id
WHERE customers.country = "Germany";

-- TODO: Q-19 Fetch details of employees who were reported for the payments made by the customers between June 2018 and July 2018
-- SELECT reported_emp.employee_id, reported_emp.first_name, reported_emp.last_name, reported_emp.email, reported_emp.job_title,
-- 		reported_emp.extension,
-- 		employees.employee_id AS reported_by_emp,
--         customers.customer_id
-- FROM employees 
-- INNER JOIN employees AS reported_emp ON employees.reports_to = reported_emp.employee_id
-- LEFT JOIN customers ON customers.sales_employee_id = customers.customer_id
-- RIGHT JOIN payments ON payments.customer_id = customers.customer_id
-- WHERE payments.payment_date BETWEEN '2018-06-01' AND '2018-07-31';


-- TODO: Q-21 Get the address of the office of the employees that reports to the employee whose id is 1102.
-- complicated because report table not found. Above commented ans also not right.


-- TODO: Q-22 Get the details of the payments of classic cars.
SELECT payments.check_number, payments.payment_date, payments.amount,
		products.product_code, products.product_name, products.product_line,
        customers.customer_id AS done_by
FROM payments
LEFT JOIN customers ON customers.customer_id = payments.customer_id
RIGHT JOIN orders ON orders.customer_id = customers.customer_id
LEFT JOIN orderdetails ON orderdetails.order_id = orders.order_id
LEFT JOIN products ON products.product_code = orderdetails.product_code
WHERE products.product_line = "classic cars";


-- TODO: Q-23 How many customers ordered from the USA.
SELECT COUNT(*) FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE customers.country = "USA"


-- TODO: Q-24 Get the comments regarding resolved orders.
SELECT orders.comments, orders.customer_id
FROM orders
WHERE orders.status = "resolved"


-- TODO: Q-25 Fetch the details of employees/salesmen in the USA with office addresses.
SELECT employees.*, offices.country
FROM employees
LEFT JOIN offices ON employees.office_code = offices.office_code
WHERE offices.country = "USA";

-- TODO: Q-26 Fetch total price of each order of motorcycles. (Hint: quantity x price for each record).
SELECT orderdetails.product_code, orderdetails.quantity_ordered , orderdetails.each_price, 
		products.product_name, products.product_line, 
        orderdetails.quantity_ordered * orderdetails.each_price AS total_price
FROM orderdetails
LEFT JOIN products ON products.product_code = orderdetails.product_code
WHERE products.product_line = "motorcycles";

-- TODO: Q-27 Get the total worth of all planes ordered.
SELECT SUM(orderdetails.quantity_ordered * orderdetails.each_price) AS total_price
FROM orderdetails
LEFT JOIN products ON products.product_code = orderdetails.product_code
WHERE products.product_line = "Planes";

-- TODO: Q-28 How many customers belong to France?
SELECT count(*)
FROM customers
WHERE customers.country = "France"

-- TODO: Q-29 Get the payments of customers living in France.
SELECT customers.customer_id, customers.first_name, customers.last_name, customers.country,
		payments.amount, payments.check_number, payments.payment_date
FROM customers
INNER JOIN payments ON payments.customer_id = customers.customer_id
WHERE customers.country = "France";

-- TODO: Q-30 Get the office address of the employees/salesmen who report to employee 1143.
SELECT DISTINCT employees.employee_id,
        offices.city, offices.phone, offices.address_line1, offices.address_line2, offices.state,
        offices.country, offices.postal_code, offices.territory
FROM employees
LEFT JOIN offices ON employees.office_code = offices.office_code
WHERE employees.reports_to = "1143";

SELECT DISTINCT offices.office_code, offices.city, offices.phone, offices.address_line1, offices.address_line2, offices.state,
        offices.country, offices.postal_code, offices.territory, employees.employee_id
FROM offices
LEFT JOIN employees ON employees.office_code = offices.office_code
WHERE employees.reports_to = "1143";