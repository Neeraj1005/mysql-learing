-- TODO: DISTINCT values

-- SELECT DISTINCT stu_fname AS FirstName, email FROM students;

-- TODO: ORDER BY

-- SELECT DISTINCT stu_fname, login_count, course_count 
-- FROM students ORDER BY login_count ASC;

-- SELECT DISTINCT stu_fname, login_count, course_count 
-- FROM students ORDER BY login_count DESC;

-- SELECT DISTINCT stu_fname, login_count, course_count 
-- FROM students ORDER BY course_count DESC; 

-- TODO: LIMIT

-- SELECT DISTINCT stu_fname, login_count 
-- FROM students ORDER BY login_count DESC LIMIT 2, 5;

-- TODO: Match pattern LIKE

-- SELECT stu_fname, email 
-- FROM students
-- WHERE stu_fname LIKE '%esh%';  

-- TODO: COUNT

-- SELECT COUNT(DISTINCT stu_fname) AS count FROM students;

-- SQL mode
-- SET @@sql_mode = '';

-- TODO: GROUP BY

-- SELECT stu_fname, signup_month, COUNT(*) FROM students
-- GROUP BY signup_month;

-- TODO: MIN MAX and SUBQUERIES

-- SELECT stu_fname, email, MAX(login_count) FROM students;
-- SELECT stu_fname, email, MIN(login_count) FROM students;

-- TODO: above query will not give the accurate result

-- SELECT stu_fname, email, login_count FROM students
-- WHERE login_count = (SELECT MAX(login_count) FROM students);

-- SELECT stu_fname, email, login_count FROM students
-- WHERE login_count = (SELECT MIN(login_count) FROM students);

-- SELECT stu_fname, email, course_count FROM students
-- WHERE course_count = (SELECT MIN(course_count) FROM students);

-- TODO: GROUP BY with MAX and MIN

-- SELECT MAX(login_count), signup_month FROM students
-- GROUP BY signup_month ORDER BY signup_month;

-- TODO: SUM and AVG with GROUP BY

-- TODO: question_1 : Total number of login and average number of course taken by users by month

-- first check condition for your doubt how many login count 7 month has 
-- SELECT signup_month, login_count 
-- FROM students
-- WHERE signup_month = 7;

-- TODO: answer of above question_1
-- SELECT signup_month, SUM(login_count) 
-- FROM students
-- GROUP BY signup_month;

-- TODO: AVG
-- SELECT signup_month, AVG(login_count) 
-- FROM students
-- GROUP BY signup_month;

-- TODO: AND or OR

-- TODO: question_2 Find users who are having login count of least 20 and are enrolled in at least 5 courses.

-- SELECT email, login_count, signup_month, course_count FROM students
-- WHERE login_count>=20 AND course_count>=5
-- ORDER BY login_count;

-- TODO: question_3 Find users who signed up in 7th and 10th month

-- SELECT email, login_count, course_count, signup_month FROM students
-- WHERE signup_month=7 OR signup_month=10;

-- TODO: RANGE - BETWEEN AND

-- SELECT email, login_count, signup_month, course_count FROM students
-- WHERE signup_month BETWEEN 7 AND 10;

-- TODO: multiple range selection - CASE

SELECT stu_fname, signup_month, 
    CASE
        WHEN signup_month BETWEEN 7 AND 10 THEN 'EARLY BIRD'
        WHEN signup_month BETWEEN 11 AND 12 THEN 'REGULAR USER'
        ELSE '##'
    END AS Custom
FROM students;
