SELECT * FROM mallcustomer_data;


--SECTION 1: Customer Base Health

--1.How many total customers do we have?

SELECT count(customerid) As Total_customerlist
from mallcustomer_data;

--2.What is the gender distribution of our customers?

SELECT gender, count(*) As Gender_list
FROM mallcustomer_data
GROUP BY gender

--3.Which age range forms the largest portion of our customers?

SELECT age, Count(*) AS ToatalAge_list
FROM mallcustomer_data
GROUP BY age
HAVING Count(*) >7
ORDER BY age ASC

--4.Are we depending too much on one customer group?

SELECT gender, Count(*) As genderlist
FROM mallcustomer_data
where spendingscore>50
group by gender

--Section 2 – Spending Behavior

--6.What is the average spending score overall?

SELECT AVG(spendingscore) As AvgSpendingScore
FROM mallcustomer_data

--7.Which gender spends more on average?

SELECT gender, AVG(spendingscore) As AVGTotalSpend
FROM mallcustomer_data
group by gender

--8.Which age group spends the most?

SELECT age, AVG(spendingscore) As AVGTotalSpend
FROM mallcustomer_data
group by age
ORDER BY AVGTotalSpend DESC

--9.Do customers aged 19–35 actually spend more, or do they just visit more?

SELECT age, AVG(spendingscore) As AVGTotalSpend
FROM mallcustomer_data
where age between 19 AND 35 
GROUP BY age 
ORDER BY AVGTotalSpend DESC

--10.Is spending concentrated among a small group, or spread evenly?

SELECT
  CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
  END AS age_group,
  COUNT(*) AS total_customers,
  ROUND(AVG(spendingscore), 2) AS avg_spending
FROM mallcustomer_data
GROUP BY age_group
ORDER BY avg_spending DESC;

--SECTION 3 – Relationship between variables (NO ANSWER)

--11.Does spending increase as income increases?
SELECT 
      CASE
	     WHEN age BETWEEN 18 AND 25 THEN '18-25'
		 WHEN age BETWEEN 26 AND 35 THEN '26-35'
		 WHEN age BETWEEN 36 AND 45 THEN '36-45'
		 WHEN age BETWEEN 46 AND 55 THEN '46-55'
		 ELSE '56+'
   END AS age_group,

   CASE
         WHEN spendingscore BETWEEN 0 AND 20 THEN 'Low(0-20)'
         WHEN spendingscore BETWEEN 21 AND 40 THEN 'Below Avg(21-40)'
         WHEN spendingscore BETWEEN 41 AND 60 THEN 'Average(41-60)'
         WHEN spendingscore BETWEEN 61 AND 80 THEN 'high(61-80)'
		 ELSE 'very high(81-100)'
   END AS spending_category,

   count(*) As total_customers,
   ROUND(AVG(Spendingscore), 2) AS avg_spending_score
   FROM mallcustomer_data
   GROUP BY age_group, spending_category
   order BY age_group, spending_category DESC;

--12.Do younger customers spend differently than older ones at the same income?

SELECT
    annualincome,
    AVG(CASE WHEN age <= 35 THEN spendingscore END) AS young_avg_spend,
    AVG(CASE WHEN age > 35 THEN spendingscore END) AS older_avg_spend
FROM mallcustomer_data
GROUP BY annualincome
HAVING 
    COUNT(CASE WHEN age <= 35 THEN 1 END) > 0
AND COUNT(CASE WHEN age > 35 THEN 1 END) > 0
ORDER BY annualincome DESC;

--13.Is there a pattern or is it random?
SELECT
    annualincome,
    ROUND(STDDEV(spendingscore), 2) AS spending_variation
FROM mallcustomer_data
GROUP BY annualincome
ORDER BY spending_variation DESC;

--14. Here is the AnnualIncome and SpendingScore 
SELECT CustomerID, Gender, Age, AnnualIncome, SpendingScore
FROM mallcustomer_data
WHERE AnnualIncome > 70 AND SpendingScore < 40
ORDER BY age DESC;