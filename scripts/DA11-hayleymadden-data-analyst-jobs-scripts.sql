-- Intiial analysis database preview

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- 1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT (*)
FROM data_analyst_jobs;

-- Answer: 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- Answer: ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY');

-- Answer: 21 postings in Tennessee. 27 postings in Tennessee or Kentucky.

-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN'
	AND star_rating > 4; 

-- Answer: 3 postings are in Tennessee and have a star rating above 4.

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- Answer: 151 postings have a review count between 500 and 1000.

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location AS state, avg(star_rating) as avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

-- Answer: Nebraska has the highest rating.

    --Check: Query returns states with NULL avg_rating: WY, null, VT, SD

    SELECT location, star_rating
    FROM data_analyst_jobs
    WHERE location IN ('WY', 'VT', 'SD');
	
	-- States have few entries and those entries have no rating data.

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT title
FROM data_analyst_jobs;

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

-- Answer: There are 881 unique job titles.

-- 8.	How many unique job titles are there for California companies?

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

-- Answer: There are 230 unique job titles for postings in California.

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company AS name_of_company, avg(star_rating) AS average_star_rating, SUM(review_count) AS total_reviews
FROM data_analyst_jobs
GROUP BY name_of_company
HAVING sum(review_count) > 5000
ORDER BY average_star_rating DESC;

-- Answer: 71 Companies have more than 5000 reviews across all locations.

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company AS name_of_company, avg(star_rating) AS average_star_rating, SUM(review_count) AS total_reviews
FROM data_analyst_jobs
GROUP BY name_of_company
HAVING sum(review_count) > 5000
ORDER BY average_star_rating DESC;

-- Answer: Google has the highest star rating.

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

-- Answer:

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

-- Answer:

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 

-- Answer:

--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

-- Answer: