--This code demonstrates how to supply data into a WHERE clause within a case 
--statement, this statement extracts the year, this makes use of the 'between'
--clause with 'when' 
SELECT 
CASE 
  when contractSigndate between '2014-04-01' and '2015-03-31' then '2014/15'
  when contractSigndate between '2013-04-01' and '2014-03-31' then '2013/14'
  else
    'Older Contract'
END AS ContrctYear,

* FROM tblContracts;


--This code takes the above cade a bit furthr by using a correlated sub-query to compare
--date and output results based on the comparison, this sub-query will count the contracts
--each client has, because this is a filtering criteria, we use "where" instead of "join"
SELECT 
CASE 
  when contractSigndate between '2014-04-01' and '2015-03-31' then '2014/15'
  when contractSigndate between '2013-04-01' and '2014-03-31' then '2013/14'
  else
    'Older Contract'
END AS ContrctYear,

CASE
when (select count(*) from tblContracts B
      where B.ContractClient = A.ContractClient) > 10
	  then 'Large'
	  else 'Small'
END AS 'Client Size',

* FROM tblContracts A;



--This code is similar to the code above, but conpares the value of two columns
SELECT 
CASE
  when gender = 1 and maritalstatus = 1 then 'Unmarried Male'
  when gender  = 2 and maritalstatus  = 2 then 'Married Female'
  when gender  = 1 and maritalstatus  = 2 then 'Married Male'
  when gender  = 2 and maritalstatus  = 1 then 'Unmarried Female'
  else 'Undefined' 
END AS MarriedStatus,

* FROM tblContacts;
