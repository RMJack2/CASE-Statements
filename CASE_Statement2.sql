--This second type of CASE statement can look at different columns and print a different result
--The CASE statement always starts with "CASE" and ends with "END"

SELECT 
CASE
  when gender  = 1 then 'Male'
  when gender  = 2 then 'Female'
  else
   'Undefined'
END
AS Gender,

--This particular CASE statement checks multiple columns, with the email column, convert was 
--needed because email column is not a varchar so it had to be converted 
CASE
 when country  = 'USA' then 'USA'
 when region = 'North Yourshire' then 'USA'
 when right(convert(varchar(200),email), 4)  = '.com' then 'USA'
 ELSE
 'Rest of World'
END
AS Country,

* FROM tblContacts; 