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
