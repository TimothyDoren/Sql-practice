Select Customers.name AS Customers 
From Customers
Left Join Orders ON Customers.id = Orders.customerId
Where Orders.customerId IS NULL;

--SQL Querry where it returns customers who never order 

/*
Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key for this table, it may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write an SQL query to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The query result format is in the following example.

*/

Select distinct
    author_id AS id
From 
    views
Where 
    author_id = viewer_id
Order by
    author_id asc

/*
Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]
 

Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

The query result format is in the following example.
*/

SELECT id, movie, description, rating
FROM Cinema
WHERE description <> 'boring' 
    AND id % 2 <> 0
ORDER BY rating desc 

/*
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key for this table.
Each row of this table contains the id and the name of an employee in a company.
 

Table: EmployeeUNI

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
(id, unique_id) is the primary key for this table.
Each row of this table contains the id and the corresponding unique id of an employee in the company.
 

Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just show null.

Return the result table in any order.

The query result format is in the following example.

*/

SELECT
    unique_id, name
FROM EmployeeUNI 
    RIGHT JOIN Employees ON EmployeeUNI.id = Employees.id


/*
Table: Prices

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+
(product_id, start_date, end_date) is the primary key for this table.
Each row of this table indicates the price of the product_id in the period from start_date to end_date.
For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
 

Table: UnitsSold

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+
There is no primary key for this table, it may contain duplicates.
Each row of this table indicates the date, units, and product_id of each product sold. 
 

Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.

Return the result table in any order.
*/

SELECT
    UnitsSold.product_id, ROUND(SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units), 2) AS average_price
FROM
    UnitsSold
    JOIN Prices ON Prices.product_id = UnitsSold.product_id
        AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY UnitsSold.product_id

/*
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key of this table.
product_id is a foreign key to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key of this table.
Each row of this table indicates the product name of each product.
 

Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.

Return the resulting table in any order.

The query result format is in the following example.
*/

SELECT
    product_name, year, price
FROM 
    Sales
LEFT JOIN
    Product ON Sales.product_id = Product.product_id


/*
Table: Teacher

+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key for this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
 

Write an SQL query to report the number of unique subjects each teacher teaches in the university.

Return the result table in any order.
*/

SELECT
    teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM
    Teacher
GROUP BY 
    teacher_id

/*
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+
employee_id is the primary key for this table.
This table contains information about the employees, their salary, and the ID of their manager. Some employees do not have a manager (manager_id is null). 
 

Write an SQL query to report the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

Return the result table ordered by employee_id.
*/
SELECT 
    employee_id
FROM 
    Employees 
WHERE 
    salary < 30000
    AND manager_id NOT IN (select employee_id from Employees)
Order By employee_id

/*
Table: Tweets

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
tweet_id is the primary key for this table.
This table contains all the tweets in a social media app.
 

Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.
*/

SELECT
    tweet_id
FROM 
    Tweets
WHERE
    LENGTH(content) > 15


/*
Still working on this problem below. It's finding the average time it takes for a machine's processes
This solution is wrong below. I need to keep working on it. 
*/
SELECT 
    machine_id, 
    ROUND((SUM(timestamp_start, (-1*timestamp_end))/(MAX(process_id) + 1)), 3) AS processing_time
FROM
    Activity
GROUP BY
    machine_id;

/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.

Sample Input

For example, CITY has four entries: DEF, ABC, PQRS and WXY.

Sample Output

ABC 3
PQRS 4
Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

Note
You can write two separate queries to get the desired output. It need not be a single query.
*/
SELECT TOP 1 CITY, LEN(CITY) AS name_length
FROM STATION
ORDER BY name_length, CITY;
SELECT TOP 1 CITY, LEN(CITY) AS name_length
FROM STATION
ORDER BY name_length DESC, CITY;

/*
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

The CITY table is described as follows:
id number
name varchar(17)
CountryCode Varchar(3)
District VARCHAR(20)
Population Number
*/

SELECT *
FROM City
WHERE Population > 100000 
    AND Countrycode = 'USA';

/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA.
*/

SELECT Name
FROM City 
WHERE Population > 120000
    AND Countrycode = 'USA';

/*
Query all columns (attributes) for every row in the CITY table.
*/

SELECT *
FROM City;

/*
Find the difference between the total number
of CITY entries in the table and the number of distinct CITY entries in the table.
*/

SELECT ((COUNT(City)) - (COUNT(DISTINCT(City))))
From Station;

/*
Query the list of CITY names starting with vowels 
(i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT City
FROM Station 
Where City LIKE '[AEIOU]%';

-- Same question as above now but flipped (ENDING with vowel)
SELECT DISTINCT City
FROM Station 
Where City LIKE '%[AEIOU]';

--Now the same question but it starts AND ends with a vowel
SELECT DISTINCT City
FROM Station 
Where City LIKE '%[AEIOU]'
    AND City Like '[AEIOU]%';

--Query the list of CITY names from STATION that do not start with vowels. 
--Your result cannot contain duplicates.

SELECT DISTINCT City
From Station 
WHERE City NOT LIKE '[AIEOU]%';

/*
Query the list of CITY names from STATION that do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT City 
FROM Station
WHERE City NOT LIKE '%[AEIOU]';

/*
Query the list of CITY names from STATION that either
 do not start with vowels or do not end with vowels. 
 Your result cannot contain duplicates.
*/

SELECT DISTINCT City
FROM Station
WHERE City NOT LIKE '%[AEIOU]' OR City NOT LIKE '[AEIOU]%';

/*
Query the list of CITY names from STATION that 
do not start with vowels and do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT City
FROM Station 
WHERE City NOT LIKE '%[AEIOU]' AND City NOT LIKE '[AEIOOU]%';

/*
Query the Name of any student in STUDENTS who scored higher than  Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

SELECT Name
FROM Students
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

/*
Write a query that prints a list of employee names (i.e.: the name attribute) 
for employees in Employee having a salary greater than 2000 per
month who have been employees for less than  months. Sort your result by ascending employee_id.
*/

SELECT Name
FROM Employee
WHERE salary > 2000 
    AND months < 10
ORDER BY employee_id ASC;

/*
Query the average population for all cities in CITY, rounded down to the nearest integer.
*/

SELECT FLOOR(AVG(Population)) AS AveragePopulation
FROM City;

/*
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/

SELECT SUM(Population)
FROM City
Where Countrycode = 'JPN';

/*
Query the difference between the maximum and minimum populations in CITY.
*/

SELECT (MAX(Population) - MIN(Population)) AS Difference
FROM City;

/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

SELECT 
  CASE
    WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR C = A THEN 'Isosceles'
    ELSE 'Scalene'
  END AS TriangleType
FROM TRIANGLES;
