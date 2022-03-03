-- TODO: concat first name and last name

-- SELECT stu_fname, stu_lname from students;

-- SELECT CONCAT(stu_fname, ' ' ,stu_lname) AS fullname,
-- login_count
-- from students;

-- SELECT 
-- CONCAT(stu_fname, ' ' ,stu_lname, ' And login count is ', login_count) AS 'user_info'
-- from students;

-- SELECT 
-- CONCAT(stu_fname, ' ' ,stu_lname, ' And login count is ', login_count, ' And course count is ', course_count) AS 'user_info'
-- from students;

-- TODO: REPLACE

-- SELECT REPLACE(stu_fname, 'a', '@') AS fun from students;

-- TODO: SUBSTRING

-- SELECT SUBSTRING(email, '1', '7') FROM students;

-- TODO: add ... at the end of email if email length is greater then 7

-- SELECT CONCAT(SUBSTRING(email, '1', '7'), "...") FROM students;

-- TODO: REVERSE

SELECT REVERSE(stu_fname) FROM students;

-- TODO: CHAR_LENGTH get length of all registered emails

-- SELECT email, CHAR_LENGTH(email) AS email_length 
-- FROM students;

-- TODO: case conversion UPPER and LOWER

-- SELECT UPPER(stu_fname) AS first_name, LOWER(stu_lname) AS last_name 
-- FROM students;


-- TODO: link for documentation https://dev.mysql.com/doc/refman/8.0/en/string-functions.html