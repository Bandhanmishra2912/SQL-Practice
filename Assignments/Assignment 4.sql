--Assignment on SQL Functions

-- Create the table
CREATE TABLE employee_salaries (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    position VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

-- Insert sample data into the table
INSERT INTO employee_salaries (employee_id, first_name, last_name, department, position, hire_date, salary) VALUES
(1, 'John', 'Doe', 'Finance', 'Analyst', '2019-05-12', 55000.00),
(2, 'Jane', 'Smith', 'Marketing', 'Manager', '2018-03-23', 72000.00),
(3, 'Paul', 'Johnson', 'IT', 'Developer', '2021-08-15', 65000.00),
(4, 'Emily', 'Davis', 'HR', 'Recruiter', '2020-11-30', 47000.00),
(5, 'Michael', 'Brown', 'Finance', 'Accountant', '2017-06-05', 60000.00),
(6, 'Sarah', 'Wilson', 'Marketing', 'Assistant', '2022-01-12', 40000.00),
(7, 'David', 'Lee', 'IT', 'System Administrator', '2016-04-20', 78000.00),
(8, 'Linda', 'Taylor', 'Operations', 'Coordinator', '2018-10-17', 52000.00),
(9, 'James', 'Anderson', 'Sales', 'Sales Executive', '2020-02-10', 58000.00),
(10, 'Patricia', 'Thomas', 'Customer Service', 'Support Agent', '2021-07-25', 45000.00);


-- Create the table
CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(20)
);

-- Insert sample data into the table
INSERT INTO orders1 (order_id, customer_id, order_date, product_name, quantity, unit_price, total_amount, order_status) VALUES
(1, 101, '2024-01-15', 'Laptop', 1, 1200.00, 1200.00, 'Shipped'),
(2, 102, '2024-02-20', 'Smartphone', 2, 500.00, 1000.00, 'Delivered'),
(3, 103, '2024-03-05', 'Office Chair', 3, 150.00, 450.00, 'Processing'),
(4, 104, '2024-04-10', 'Desk', 1, 300.00, 300.00, 'Cancelled'),
(5, 105, '2024-05-25', 'Tablet', 1, 350.00, 350.00, 'Shipped'),
(6, 106, '2024-06-15', 'Monitor', 2, 200.00, 400.00, 'Delivered'),
(7, 107, '2024-07-10', 'Keyboard', 5, 40.00, 200.00, 'Processing'),
(8, 108, '2024-08-05', 'Mouse', 10, 25.00, 250.00, 'Delivered'),
(9, 109, '2024-09-12', 'Printer', 1, 150.00, 150.00, 'Shipped'),
(10, 110, '2024-10-01', 'Headphones', 3, 80.00, 240.00, 'Delivered');

INSERT INTO orders1 (order_id, customer_id, order_date, product_name, quantity, unit_price, total_amount, order_status) VALUES
(11, 101, '2025-01-25', 'Laptop', 1, 2000.00, 2100.00, 'Shipped'),
(12, 102, '2025-02-21', 'Smartphone', 2, 1500.00, 2300.00, 'Delivered'),
(13, 103, '2025-03-22', 'Office Chair', 3, 550.00, 1450.00, 'Processing'),
(14, 104, '2025-04-12', 'Desk', 1, 900.00, 2800.00, 'Cancelled'),
(15, 105, '2025-05-25', 'Tablet', 1, 650.00, 1350.00, 'Shipped'),
(16, 106, '2025-06-11', 'Monitor', 2, 700.00, 2400.00, 'Delivered'),
(17, 107, '2025-07-23', 'Keyboard', 5, 420.00, 1200.00, 'Processing'),
(18, 108, '2025-08-12', 'Mouse', 10, 125.00, 2250.00, 'Delivered'),
(19, 109, '2025-09-15', 'Printer', 1, 150.00, 3150.00, 'Shipped'),
(20, 110, '2025-10-14', 'Headphones', 3, 150.00, 1240.00, 'Delivered');

INSERT INTO orders1 (order_id, customer_id, order_date, product_name, quantity, unit_price, total_amount, order_status) VALUES
(21, 101, '2024-01-25', 'Laptop', 1, 2000.00, 2100.00, 'Shipped'),
(22, 102, '2024-02-21', 'Smartphone', 2, 1500.00, 2300.00, 'Delivered'),
(23, 103, '2024-03-22', 'Office Chair', 3, 550.00, 1450.00, 'Processing'),
(24, 104, '2024-04-12', 'Desk', 1, 900.00, 2800.00, 'Cancelled'),
(25, 105, '2024-05-25', 'Tablet', 1, 650.00, 1350.00, 'Shipped'),
(26, 106, '2024-06-11', 'Monitor', 2, 700.00, 2400.00, 'Delivered'),
(27, 107, '2024-07-23', 'Keyboard', 5, 420.00, 1200.00, 'Processing'),
(28, 108, '2024-08-12', 'Mouse', 10, 125.00, 2250.00, 'Delivered'),
(29, 109, '2024-09-15', 'Printer', 1, 150.00, 3150.00, 'Shipped'),
(30, 110, '2024-10-14', 'Headphones', 3, 150.00, 1240.00, 'Delivered');


SELECT * FROM ORDERS1
SELECT * FROM employee_salaries

--1. Concatenate first and last names as fullname from a table employee_Salaries table.

SELECT FIRST_NAME, LAST_NAME, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME FROM employee_salaries

--2.Calculate average, maximum, and rounded salary from an employee_salaries table.

SELECT ROUND(AVG(SALARY),0) AVERAGE_SAL, ROUND(MAX(SALARY), 0) HIGHEST_SAL FROM employee_salaries 

--3.Filter records in orders table between '2024-01-01' and '2024-12-31':

SELECT * FROM ORDERS1 WHERE ORDER_DATE BETWEEN '01-01-2024' AND '12-31-2024'

--4. Write a query to retrieve all orders that are currently in "Processing" status.

SELECT * FROM orders1 WHERE ORDER_STATUS = 'PROCESSING'

--5. Write a query to calculate the total sales (total_amount) for each month in 2024.

SELECT DATEPART(MONTH, ORDER_DATE) SORTED_BY_MONTH, SUM(TOTAL_AMOUNT) TOTAL_SALES FROM ORDERS1
WHERE DATEPART(YEAR, ORDER_DATE) = 2024 GROUP BY DATEPART(MONTH, ORDER_DATE)

--6.Write a query to find the average total_amount of all completed orders (status "Delivered").

SELECT AVG(TOTAL_AMOUNT) AVERAGE_AMOUNT FROM ORDERS1 WHERE ORDER_STATUS = 'DELIVERED'

--7.Write a query to find the highest and lowest total_amount orders from the orders table.

SELECT MAX(TOTAL_AMOUNT) HIGHEST_AMOUNT, MIN(TOTAL_AMOUNT) LOWEST_AMOUNT FROM ORDERS1

--8.Write a query to find all orders where the total_amount is greater than $500.

SELECT TOTAL_AMOUNT FROM ORDERS1 WHERE TOTAL_AMOUNT > 500

--9.Write a query to display the count of orders for each order_status.

SELECT SUM(QUANTITY) TOTAL_ORDERS, ORDER_STATUS FROM ORDERS1 GROUP BY ORDER_STATUS

--10.Write a query to list the top 3 most ordered products based on the quantity ordered.

SELECT TOP 3 PRODUCT_NAME MOST_ORDERED, QUANTITY FROM ORDERS1 ORDER BY QUANTITY DESC

--11. Write a query to find the customer_ids of customers who have placed more than one order.

SELECT CUSTOMER_ID, COUNT(ORDER_ID) TOTAL_ORDERS FROM ORDERS1 GROUP BY CUSTOMER_ID HAVING COUNT(ORDER_ID) > 1

--12. Write a query to calculate the total revenue generated by each product (product_name).

SELECT PRODUCT_NAME, SUM(TOTAL_AMOUNT) TOTAL_REVENUE FROM ORDERS1 GROUP BY PRODUCT_NAME

--13.Write a query to list all orders placed between '2024-03-01' and '2024-06-30'.

SELECT * FROM ORDERS1 WHERE ORDER_DATE BETWEEN '03-01-2024' AND '06-30-2024'

--14.Write a query to find the first and last order date for each customer.

SELECT CUSTOMER_ID, MIN(ORDER_DATE) FIRST_ORDER, MAX(ORDER_DATE) LAST_ORDER FROM ORDERS1 GROUP BY CUSTOMER_ID

--15.Assuming a 7% sales tax, write a query to calculate the sales tax and total amount including tax for each order.

SELECT TOTAL_AMOUNT, (TOTAL_AMOUNT * 0.07) SALES_TAX, (TOTAL_AMOUNT + (TOTAL_AMOUNT * 0.07)) TAX_ADDED_TOTAL FROM ORDERS1

--16.Write a query to display the number of orders placed each month in 2024.

SELECT DATEPART(MONTH, ORDER_DATE) SORTED_BY_MONTH, COUNT(ORDER_ID) TOTAL_ORDERS FROM ORDERS1 GROUP BY DATEPART(MONTH, ORDER_DATE)

--17.Write a query to extract the month and year from the order_date and format it as "Month YYYY" (e.g., "January 2024").

SELECT ORDER_DATE, FORMAT(ORDER_DATE, 'MMMM yyyy') FORMATTED_DATE FROM ORDERS1

--18.Write a query to calculate the cumulative sales (total_amount) for all orders sorted by order_date.

SELECT ORDER_ID, ORDER_DATE, TOTAL_AMOUNT, SUM(TOTAL_AMOUNT) OVER (ORDER BY ORDER_DATE) AS CUMULATIVE_SALES FROM ORDERS1 ORDER BY ORDER_DATE

--19.Write a query to find all orders that contain the word "Laptop" in the product_name.

SELECT * FROM ORDERS1 WHERE PRODUCT_NAME = 'LAPTOP'

--20.Assume orders over $1000 have a 10% discount. Write a query to calculate the discounted price for such orders.

SELECT TOTAL_AMOUNT, (TOTAL_AMOUNT - TOTAL_AMOUNT * 0.1) DISCOUNTED_AMOUNT FROM ORDERS1 WHERE TOTAL_AMOUNT > 1000

--21.Write a query to group orders by quarter and show the total sales in each quarter.

SELECT DATEPART(QUARTER, ORDER_DATE) QUARTERLY, SUM(TOTAL_AMOUNT) TOTAL_SALES FROM ORDERS1 GROUP BY DATEPART(QUARTER, order_date) ORDER BY QUARTERLY

--22.Write a query to list all orders for a customer with customer_id = 105, including the order details and total amount.

SELECT * FROM ORDERS1 WHERE CUSTOMER_ID = 105