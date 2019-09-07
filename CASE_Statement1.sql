--This code demonstrates the use of the CASE statement, this code replaces the 1 for male and 2 for 
--female and places that designation into the 'Gender Label' column

SELECT 
  CASE GENDER
  when 1 then 'Male'
  when 2 then 'Female'
  ELSE
    'Undefined'
   END AS 'Gender Label',

--This part does the same but alters the region column
  CASE REGION
  when 'teeside' then 'UK'
  when 'north yourshire' then 'UK'
  when 'tyne and wear' then 'UK'
  else
  'USA'
  END AS 'Country',

  --This part takes the part of the date representing the month and replaceing it with text 
  --depicting the abbreviated literal month
  CASE MONTH(dateofbirth)
  when 1 then 'JAN'
  when 2 then 'FEB'
  when 3 then 'MAR'
  when 4 then 'APR'
  when 5 then 'MAY'
  when 6 then 'JUN'
  else
    'OTHER'
  END AS MonthDOB,

* FROM tblContacts;



 