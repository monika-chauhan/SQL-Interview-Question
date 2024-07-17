Question1: Explain Order of exeution of the SQL Query?
Answer: The correct order of execution in SQL is FROM, WHERE, GROUP BY, HAVING, SELECT, DISTINCT, ORDER BY and LIMIT.

Question2: What is the difference between where and having clause?
Answer: Where Clause: WHERE clause allows you to filter data from specific rows (individual rows) from a table based on certain conditions.
        Having Clause: The HAVING clause allows you to filter data from a group of rows in a query based on conditions involving aggregate values.

Question3: What is the use of group by clause?
Answer: GROUP BY Clause is used to collect data from multiple records and group the result by one or more column.

Question4: Explain all types of the joins?
Answer: 
SQL Server supports many kinds of different joins including INNER JOIN, SELF JOIN, CROSS JOIN, and OUTER JOIN. 
In fact, each join type defines the way two tables are related in a query. 
OUTER JOINS can further be divided into LEFT OUTER JOINS, RIGHT OUTER JOINS, and FULL OUTER JOINS.
SQL INNER JOIN: creates a result table by combining rows that have matching values in two or more tables.
SQL LEFT OUTER JOIN: includes in a result table unmatched rows from the table that is specified before the LEFT OUTER JOIN clause.
SQL RIGHT OUTER JOIN: creates a result table and includes into it all the records from the right table and only matching rows from the left table.
SQL SELF JOIN: joins the table to itself and allows comparing rows within the same table.
SQL CROSS JOIN: creates a result table containing paired combination of each row of the first table with each row of the second table.

Questions5: What are triggers in SQL?
Answer: A trigger in SQL is a procedural code that is automatically executed in response to certain events on a specified table. 
It is important to understand how these small codes make such a huge difference in database performance. 
-----------------------------------------------------------------
--Syntax of Trigger
Create Trigger Trigger_Name
(Before | After)  [ Insert | Update | Delete]
on [Table_Name]
[ for each row | for each column ]
[ trigger_body ]
--------------------------------------------------------------------------
--Create Trigger:
These two keywords are used to specify that a trigger block is going to be declared. 
--Trigger_Name
It specifies the name of the trigger. Trigger name has to be unique and shouldn’t repeat.
--( Before | After )
This specifies when the trigger will be executed. It tells us the time at which the trigger is initiated, i.e, either before the ongoing event or after.
--Before Triggers: 
are used to update or validate record values before they’re saved to the database. 
--After Triggers: 
are used to access field values that are set by the system and to effect changes in other records. The records that activate the after trigger are read-only. 
We cannot use After trigger if we want to update a record because it will lead to read-only error.
--[ Insert | Update | Delete ]
These are the DML operations and we can use either of them in a given trigger.
--on [ Table_Name ]
 We need to mention the table name on which the trigger is being applied. Don’t forget to use on keyword and also make sure the selected table is present in the database.
--[ for each row | for each column ] 
  Row-level trigger gets executed before or after any column value of a row changes
  Column Level Trigger gets executed before or after the specified column changes
--[ trigger_body]
 ItData Manipulation Language consists of queries that need to be executed when the trigger is called.
-------------------------------------------------------
--Operations in Triggers
We can perform many operations using triggers. Some may be simple and some may be a little complex, but once if we go through the query its easy to understand.
--DROP A Trigger
DROP TRIGGER trigger name;
Display A Trigger 
-----------------------------------------
The below code will display all the triggers that are present.
SHOW TRIGGERS;
-------------------------------------------
The below code will display all the triggers that are present in a particular database.
SHOW TRIGGERS
IN database_name;
Example:
--SHOW TRIGGERS IN edureka;

Question 6: What is Stored procedure in SQL?
Answer: A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again. 
So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

Question 8: What is the difference between delete and truncate?
Answer: DELETE is a SQL command that removes one or multiple rows from a table using conditions. 
TRUNCATE is a SQL command that removes all the rows from a table without using any condition.

Question 9: What is the difference between DDL, DML, DCL?
Answer: DDL (Data Definition Language)commands are used to define and control the database.  Commands: CREATE, DROP, ALTER ,TRUNCATE
DML (Data Manipulation Language) is used to control and manipulate the data. Commands: Insert, Delete, Update, Call,explain call,Lock
DCL (Data Control Language) is used for security and access to the database. Commands: Grant, revoke
TCL (Transaction Control Language) Transactions group a set of tasks into a single execution unit. 
Each transaction begins with a specific task and ends when all the tasks in the group are successfully completed. 
If any of the tasks fail, the transaction fails. Commands: Begin transaction,  commit, rollback, savepoint 
DQL (Data Query Language)  are used for performing queries on the data within schema objects. Commands: select 

Questions 10: What are aggregate function and when do we use them? explain with few example?
Answer: An aggregate function in SQL returns one value after calculating multiple values of a column. We often use aggregate functions with the GROUP BY and HAVING 
        clauses of the SELECT statement.
--There are 5 types of SQL aggregate functions:
Count() : function returns the number of rows in a database table.
Sum() : function returns the total sum of a numeric column.
Avg() : function calculates the average of a set of values.
Min() : aggregate function returns the lowest value (minimum) in a set of non-NULL values.
Max() : aggregate function returns the highest value (maximum) in a set of non-NULL values.
--Why Use Aggregate Functions?
Aggregate functions are a vital component of database management systems. They allow us to perform calculations on large data sets quickly and efficiently. 
        For example, these functions generate statistical reports, perform financial analysis, and manage inventory levels. 

Question 11:  Which is faster between CTE and subquery?
Answer: It is important to keep in mind that CTEs are just syntactic sugar and not a fundamental feature. They will, by definition, NEVER be faster than a proper
        subquery and often are slower (but, you say, what about materialized CTEs  well, those are just syntactic sugar for materialized/indexed views).

Questions 12: What are the constraints and types of constraints?
Answer: Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table.
        If there is any violation between the constraint and the data action, the action is aborted.
The following constraints are commonly used in SQL:

NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly

Question 13: Types of Keys?
Answer: They facilitate efficient data retrieval, ensure data integrity, and establish relationships between tables. With these Keys, SQL databases would resemble
        unorganised collections of data, making it easier to manage and query effectively.  
SQL offers several types of Keys, each serving a distinct purpose in the database ecosystem: 
1) Primary Key: It is an identifier for each record in a table. It ensures data uniqueness and serves as a reference for establishing relationships.  
2) Unique Key: Like a Primary Key, a Unique Key enforces uniqueness but allows null values. It is used for columns that must be unique but might contain missing information.  
3) Foreign Key: A Foreign Key establishes a link between two tables based on a standard column. It maintains referential integrity and enforces relationships between tables.  
4) Composite Key: A Composite Key uses multiple columns to create a unique identifier. It is useful when a single column cannot ensure uniqueness.  
5) Candidate Key: Candidate Keys are potential options for Primary Keys. They share the properties of uniqueness and minimal redundancy.  
6) Alternate Key: An Alternate Key is a candidate key that is not chosen as the Primary Key. It provides additional options for uniquely identifying records.  
7) Super Key: It is a set of attributes that, taken together, uniquely identify records. It can include more details than necessary for a primary key. 

Question 14: Different types of operators?
Answer: 
1. SQL Arithmetic Operators
Operator Description	
+	        Add	
-	        Subtract	
*	        Multiply	
/	        Divide	
%	        Modulo

2. SQL Bitwise Operators
Operator	Description
&	        Bitwise AND
|	        Bitwise OR
^	        Bitwise exclusive OR

3. SQL Comparison Operators
Operator	Description	
=	        Equal to	
>	        Greater than	
<	        Less than	
>=	        Greater than or equal to	
<=	        Less than or equal to	
<>	        Not equal to

4. SQL Compound Operators
Operator	Description
+=	        Add equals
-=	        Subtract equals
*=	        Multiply equals
/=	        Divide equals
%=	        Modulo equals
&=	        Bitwise AND equals
^-=	        Bitwise exclusive equals
|*=	        Bitwise OR equals

5. SQL Logical Operators
Operator	Description	
ALL	        TRUE if all of the subquery values meet the condition	
AND	        TRUE if all the conditions separated by AND is TRUE	
ANY	        TRUE if any of the subquery values meet the condition	
BETWEEN	    TRUE if the operand is within the range of comparisons	
EXISTS	    TRUE if the subquery returns one or more records	
IN	        TRUE if the operand is equal to one of a list of expressions	
LIKE	    TRUE if the operand matches a pattern	
NOT	        Displays a record if the condition(s) is NOT TRUE	
OR	        TRUE if any of the conditions separated by OR is TRUE	
SOME	    TRUE if any of the subquery values meet the condition

Question 15: Difference between Group by and where clause?
Answer: Where Clause is generally used to filter the rows from a table based on a specific condition. 
Group by clause is used to group rows by one or more columns. It does not involve an aggregate function. It involves aggregations functions like SUM(), AVG(), 
        COUNT(),MAX() etc.

Question 16: What are views?
Answer: In SQL, a view is a virtual table based on the result-set of an SQL statement. A view contains rows and columns, just like a real table.
        The fields in a view are fields from one or more real tables in the database.

Question 17: what is the difference between nvarchar and varchar?
Answer: Varchar:- stores Non-unicode or English character data types, and it can contain a maximum of 8000 characters. It only supports ASCII values.
Nvarchar:- stores Unicode or Non-English character data types, and it can contain a maximum of 4000 characters. It supports ASCII values as well as special characters

Question 18: what is the difference between char and nchar?
Answer: The collation order of the CHAR data type follows the code-set order,
But the collating order of the NCHAR data type can be a localized order, if DB_LOCALE (or SET COLLATION) specifies a locale that defines a localized order for collation.
CHAR(size)	 : A FIXED length string (can contain letters, numbers, and special characters).The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1
nchar	     : Fixed width Unicode string	4,000 characters	Defined width x 2

Question 19: What are index and their types?
Answer: Indexes are used to retrieve data from the database very fast. The users cannot see the indexes, they are just used to speed up searches/queries.
There are various types of indexes in SQL server: 
Clustered Index : Clustered Index stores and sort rows of data in a view or table depending on their central values. 
Non-Clustered Index : It represents a structure, which is isolated from data rows. This types of indexes in SQL server covers the non-clustered key values, 
                        and each worth pair has a pointer to the data row that comprises vital significance. 
Column Store Index : A column store index is one of the types of indexes in SQL Server that has a standard type of index with regards to putting away and 
                        questioning enormous data warehousing truth tables. 
Filtered Index :A filtered index is one of the types of indexes in an SQL server that is made when a column has just a few applicable numbers for questions
                on the subset of values. If, when a table comprises heterogeneous data rows, a separated list is made in SQL for at least one sort of data. 
Hash Index : Hash Index is one of the types of indexes in SQL server that slots containing a pointer or an array of N buckets and a row on each slot or bucket.
                It utilizes the Hash function F (K, N), where N is several buckets and K is critical. 
Unique Index : The unique index in the SQL server confirms and guarantees that the index key doesn’t contain any copy esteems and along these lines, empowers the 
        clients to examine that each row in the table is exceptional in either way. 

Question 20: Different types of relationships in SQL?
Answer: Relationships in SQL refer to the associations or connections between tables in a relational database. These relationships are established using foreign keys,
        which are columns in a table that refer to the primary key in another table. Relationships help organize and structure data, allowing for efficient data retrieval
        and maintaining data integrity.
Type of Relationships in SQL:
one-to-one: Definition: Each record in Table A is associated with one and only one record in Table B, and vice versa.
            Setup: Include a foreign key in one of the tables that references the primary key of the other table.
one-to-many:Definition: Each record in Table A can be associated with multiple records in Table B, but each record in Table B is associated with only one record in Table A.
            Setup : Include a foreign key in the “many” side table (Table B) that references the primary key of the “one” side table (Table A).
many-to-many:Definition: Each record in Table A can be associated with multiple records in Table B, and vice versa.
            Setup: Create an intermediate table (also known as a junction or linking table) that contains foreign keys referencing both related tables. 
Many-to-One :Definition: Multiple records in table B can be associated with one record in table A.
                        Setup: Crate a Foreign key in “Many Table” that references to Primary Key in “One Table”.
Self-Referencing:Definition: A table has a foreign key that references its primary key.
                Setup: Include a foreign key column in the same table that references its primary key.

Question 21: Difference between Union and Union ALL?
Answer: The result set of UNION does not contain duplicate rows, while the result set of UNION ALL returns all the rows from both tables. 

Question 22: How many types of Clause in SQL?
Answer: he sql clauses can help filter out the data according to the user needs. The main clauses are SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY, INSERT, UPDATE, DELETE, and JOIN. 

Question 23: Difference between primary and secondary key?
Answer: A key that is unique, not null, and is selected by the database administrator to uniquely identify tuples is called the primary key. 
        A key that uniquely identifies rows but is not selected as the primary key is known as a secondary key or alternate key.

Question 24: Find the second largest Salary from employee table?
Answer: SELECT * FROM(
SELECT emp_name, salary, DENSE_RANK() 
over(ORDER BY salary desc) As alias_for_nested_query FROM employee) As alias_for_first_query
WHERE alias_for_nested_query=N; 
Replace N with 2

Question 24: Write Retention Query in SQL?
Answer: SELECT user_id, min(DATEPART (week, login_date)) AS first FROM login GROUP BY user_id; 
Output: Using the INNER JOIN group both the results 'login_week and first' to calculate retention rate.

Question 26:Write year on year growth query in SQL?
Answer: -- Sol 
WITH t AS (
  ...
)
SELECT
    *,
    LAG(total_sales, 1) OVER (ORDER BY year) AS total_sales_prev_year,
    ROUND((total_sales - LAG(total_sales, 1) OVER (ORDER BY year)) / LAG(total_sales, 1) OVER (ORDER BY year), 2) AS growth_rate
FROM t

Question 27: Write a query for commulative sum?
Answer:  -- Sol
SELECT Date, Sales, 
SUM(Sales) 
OVER (ORDER BY Date) as CumulativeSales
FROM daily_sales;

Question 28: Difference between Function and store procedure?
Answer:  A function must return a single value, whereas a stored procedure can return a single value, multiple values, or no value at all. 
Functions are designed to encapsulate calculations or transformations and return the result, while procedures are focused on data manipulation and processing.

Question 29: Do we use variable in views?
Answer: Although in earlier versions of SQL Server, the @@ functions are referred to as global variables, @@ functions are not variables, 
and they do not have the same behaviors as variables. The @@ functions are system functions, and their syntax usage follows the rules for functions.
        You can not use variables in a view.

Question 30: What are the limitations of views?
Answer:Limitations When Working with SQL Server Views
1.You cannot pass parameters to SQL Server views.
2.Cannot use an Order By clause with views without specifying FOR XML or TOP.
3.Views cannot be created on Temporary Tables.
4.You cannot associate rules and defaults with views.

