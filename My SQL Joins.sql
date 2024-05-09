/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
SELECT  products.Name, categories.Name
FROM products
INNER JOIN categories
on products.CategoryID = categories.CategoryID
WHERE categories.Name = 'computers';


/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name AS 'product Name', products.Price, reviews.Rating
FROM products
INNER JOIN reviews
on products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.EmployeeID, FirstName, Lastname, SUM(Quantity)
FROM  employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
HAVING SUM(Quantity) = (
SELECT SUM(Quantity)
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY SUM(Quantity) DESC
LIMIT 1
);

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM categories
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
for Eagles: Hotel California --You may need to use SUM() */
SELECT products.ProductID, products.Name, SUM(Quantity), SUM(PricePerUnit)
FROM products
INNER JOIN sales
ON sales.ProductID = products.ProductID
WHERE Name Like '%Eagles%Hotel%California%'
GROUP BY products.ProductID;



/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT Name, Reviewer, Rating, Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE Name  LIKE '%Visio%TV%' AND Rating = 1;
-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT sales.EmployeeID, FirstName, LastName, Name as 'Product Name', SUM(Quantity)
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products
ON products.ProductID = sales.ProductID
GROUP BY sales.EmployeeID, products.ProductID;