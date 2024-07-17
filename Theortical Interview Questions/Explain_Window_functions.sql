Question 6:Explain all types on Window Function? (Mainly rank,row_num,dense_rank,lead & lag)
Answer: Window Function : A window function performs a calculation across a set of table rows that are somehow related to the current row. 
This is comparable to the type of calculation that can be done with an aggregate function.
But unlike regular aggregate functions, use of a window function does not cause rows to become grouped into a single output row — the rows retain their separate identities.
Behind the scenes, the window function is able to access more than just the current row of the query result
--Example : Running_Total 
SELECT duration_seconds,
       SUM(duration_seconds) OVER (ORDER BY start_time) AS running_total
  FROM tutorial.dc_bikeshare_q1_2012

If you did like to narrow the window from the entire dataset to individual groups within the dataset,
you can use PARTITION BY to do so:
--Example
SELECT start_terminal,
       duration_seconds,
       SUM(duration_seconds) OVER
         (PARTITION BY start_terminal ORDER BY start_time)
         AS running_total
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'

--Note: You can't use window functions and standard aggregations in the same query. 
--More specifically, you can't include window functions in a GROUP BY clause.

ROW_NUMBER():  does just what it sounds like—displays the number of a given row. 
It starts are 1 and numbers the rows according to the ORDER BY part of the window statement. 
ROW_NUMBER() does not require you to specify a variable within the parentheses:
--Example:
SELECT start_terminal,
       start_time,
       duration_seconds,
       ROW_NUMBER() OVER (ORDER BY start_time)
                    AS row_number
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'

Using the PARTITION BY clause will allow you to begin counting 1 again in each partition. 
The following query starts the count over again for each terminal:
 SELECT start_terminal,
       start_time,
       duration_seconds,
       ROW_NUMBER() OVER (PARTITION BY start_terminal
                          ORDER BY start_time)
                    AS row_number
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
-------------------------------------------------------------------
RANK() and DENSE_RANK():
RANK() is slightly different from ROW_NUMBER(). If you order by start_time, for example, it might be the case that some terminals have rides with two identical start times. 
In this case, they are given the same rank, whereas ROW_NUMBER() gives them different numbers. In the following query, you notice the 4th and 5th observations 
for start_terminal 31000—they are both given a rank of 4, and the following result receives a rank of 6:

SELECT start_terminal,
       duration_seconds,
       RANK() OVER (PARTITION BY start_terminal
                    ORDER BY start_time)
              AS rank
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'

You can also use DENSE_RANK() instead of RANK() depending on your application. Imagine a situation in which three entries have the same value. 
Using either command, they will all get the same rank. For the sake of this example, let's say it's "2." Here is how the two commands would evaluate the next results differently:
RANK() would give the identical rows a rank of 2, then skip ranks 3 and 4, so the next result would be 5
DENSE_RANK() would still give all the identical rows a rank of 2, 
but the following row would be 3—no ranks would be skipped.
-----------------------------------------------------
NTILE
You can use window functions to identify what percentile (or quartile, or any other subdivision) a given row falls into. The syntax is NTILE(*# of buckets*). In this case,
ORDER BY determines which column to use to determine the quartiles (or whatever number of tiles you specify). For example:

SELECT start_terminal,
       duration_seconds,
       NTILE(4) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
          AS quartile,
       NTILE(5) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS quintile,
       NTILE(100) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS percentile
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY start_terminal, duration_seconds
--------------------------------------------------------------------------------
LAG and LEAD
It can often be useful to compare rows to preceding or following rows, especially if you have got the data in an order that makes sense. 
You can use LAG or LEAD to create columns that pull values from other rows—all you need to do is enter which column to pull from and how many rows away you  did like to do the pull. LAG pulls from previous rows and LEAD pulls from following rows:
SELECT start_terminal,
       duration_seconds,
       LAG(duration_seconds, 1) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds) AS lag,
       LEAD(duration_seconds, 1) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds) AS lead
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY start_terminal, duration_seconds
---------------------------------------------------------------------------
This is especially useful if you want to calculate differences between rows:

SELECT start_terminal,
       duration_seconds,
       duration_seconds -LAG(duration_seconds, 1) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS difference
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY start_terminal, duration_seconds
---------------------------------------------------------------------------
The first row of the difference column is null because there is no previous row from which to pull. Similarly, using LEAD will create nulls at the end of the dataset. 
If you did like to make the results a bit cleaner, you can wrap it in an outer query to remove nulls:

SELECT *
  FROM (
    SELECT start_terminal,
           duration_seconds,
           duration_seconds -LAG(duration_seconds, 1) OVER
             (PARTITION BY start_terminal ORDER BY duration_seconds)
             AS difference
      FROM tutorial.dc_bikeshare_q1_2012
     WHERE start_time < '2012-01-08'
     ORDER BY start_terminal, duration_seconds
       ) sub
 WHERE sub.difference IS NOT NULL

---------------------------------------------------------
Defining a window alias
If you are planning to write several window functions in to the same query, using the same window, you can create an alias. Take the NTILE example above:

SELECT start_terminal,
       duration_seconds,
       NTILE(4) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS quartile,
       NTILE(5) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS quintile,
       NTILE(100) OVER
         (PARTITION BY start_terminal ORDER BY duration_seconds)
         AS percentile
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
 ORDER BY start_terminal, duration_seconds

 
This can be rewritten as:

SELECT start_terminal,
       duration_seconds,
       NTILE(4) OVER ntile_window AS quartile,
       NTILE(5) OVER ntile_window AS quintile,
       NTILE(100) OVER ntile_window AS percentile
  FROM tutorial.dc_bikeshare_q1_2012
 WHERE start_time < '2012-01-08'
WINDOW ntile_window AS
         (PARTITION BY start_terminal ORDER BY duration_seconds)
 ORDER BY start_terminal, duration_seconds
The WINDOW clause, if included, should always come after the WHERE clause.