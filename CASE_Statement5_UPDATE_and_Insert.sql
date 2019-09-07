--This code demonstrates how to use UPDATE and INSERT with CASE statements, in this code we 
--update empty NULL collums
select 
case
when contractsigndate between '2014-04-01' and '2015-03-31' then '2014/15'
when contractsigndate between '2013-04-01' and '2014-03-31' then '2013/14'
when contractsigndate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Older Contract'
END as ContractYear
,* from tblcontracts

--This part will update the contractYear column(be sure to run these bits of code seperately,
--this one and the one immediately above)
UPDATE tblContracts
SET contractYear = 
(CASE
when contractsigndate between '2014-04-01' and '2015-03-31' then '2014/15'
when contractsigndate between '2013-04-01' and '2014-03-31' then '2013/14'
when contractsigndate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Pre 2012'
END)


--This code demonstrates how to build data for a temporary table
CREATE TABLE #DEALS
(dealYear VARCHAR(10), dealSales float, dealWeeks int);

--Here, we insert into the "#DEALS" table and use a select statement to do that.
--what this will do is insert into the columns below the results of the 
--select statement
INSERT INTO #DEALS(dealYear, dealSales)
SELECT
 
case
when contractsigndate between '2014-04-01' and '2015-03-31' then '2014/15'
when contractsigndate between '2013-04-01' and '2014-03-31' then '2013/14'
when contractsigndate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Pre 2012'
END ,
SUM(contractValue) FROM tblContracts
GROUP BY
--This groups the data by each possible date scenario's 
(case
when contractsigndate between '2014-04-01' and '2015-03-31' then '2014/15'
when contractsigndate between '2013-04-01' and '2014-03-31' then '2013/14'
when contractsigndate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Pre 2012'
END)

/*Finally, this will show us the new data in the #DEALS table
SELECT * FROM #DEALS;*/

--Here we update the new table from the weeks table
select 
(case
when weekstartdate between '2014-04-01' and '2015-03-31' then '2014/15'
when weekstartdate between '2013-04-01' and '2014-03-31' then '2013/14'
when weekstartdate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Older Contract'
END),
COUNT(weekid)
 FROM tblWeeks
 GROUP BY 
 case
when weekStartDate between '2014-04-01' and '2015-03-31' then '2014/15'
when weekStartDate between '2013-04-01' and '2014-03-31' then '2013/14'
when weekStartDate between '2012-04-01' and '2013-03-31' then '2012/13'
else
'Older Contract'
END