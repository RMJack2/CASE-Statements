--This code demonstrates how to use the CASE statement other than SELECT
select 
case
when contractsigndate between '2014-04-01' and '2015-03-31' then '2014/15'
when contractsigndate between '2013-04-01' and '2014-03-31' then '2013/14'
when contractsigndate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Older Contract'
END as ContractYear
,* from tblcontracts

--Here, I use a WHERE clause to find a specific year, the right side of the equal
--sign looks through the CASE statemtnt and pulls the necessary information
where
(case
when contractsigndate between '2014-04-01' and '2015-03-31' then '2014/15'
when contractsigndate between '2013-04-01' and '2014-03-31' then '2013/14'
when contractsigndate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Older Contract'
END) = '2012/13'
