-- 1. Check data import

-- Total number of people in the DB :
SELECT COUNT(*) AS total_personnes
FROM Person;

-- Total number of jobs registered :
SELECT COUNT(*) AS total_jobs
FROM Jobs;

-- Total number of transactions recorded in each table :
SELECT 'Income_Expenses' AS table_name, COUNT(*) AS total
FROM Income_Expenses
UNION ALL
SELECT 'Financial_Assistance', COUNT(*)
FROM Financial_Assistance
UNION ALL
SELECT 'Economical_Impact', COUNT(*)
FROM Economical_Impact;



-- 2. Employment trends and job losses

-- Distribution of job types
SELECT Job_Type, COUNT(*) AS numbers
FROM Jobs
GROUP BY Job_Type
ORDER BY numbers DESC;

-- Number of people who lost their jobs due to COVID-19
SELECT Job_Loss, COUNT(*) AS total
FROM Jobs
GROUP BY Job_Loss;

-- Top 3 countries with the highest rate of job losses
SELECT P.Country, COUNT(J.ID) AS total_losses 
FROM Jobs J
JOIN Person P
ON J.ID = P.ID
WHERE J.Job_Loss = 'Yes'
GROUP BY P.Country
ORDER BY total_losses DESC
LIMIT 3;



-- 3. Income and expense analysis

-- Monthly income breakdown
SELECT Monthly_Income_Bracket, COUNT(*) AS numbers
FROM Income_Expenses
GROUP BY Monthly_Income_Bracket
ORDER BY Monthly_Income_Bracket ASC;

-- Impact of COVID-19 on revenues
SELECT Income_Change, COUNT(*) AS numbers
FROM Income_Expenses
GROUP BY Income_Change
ORDER BY numbers DESC;

-- Average monthly expenses by country
SELECT P.Country, ROUND(AVG(Income_Expenses.Monthly_Need), 2) AS average_expenses
FROM Income_Expenses
JOIN Person P ON Income_Expenses.ID = P.ID
GROUP BY P.Country
ORDER BY average_expenses DESC;



-- 4. Étude des aides financières

-- Number of people who received assistance
SELECT Aid, COUNT(*) AS total
FROM Financial_Assistance
GROUP BY Aid;

-- Breakdown of support sources
SELECT 'Government' AS source, COUNT(*)
FROM Financial_Assistance
WHERE AidSource_Government = 'Yes'
UNION ALL
SELECT 'Charities/Donations', COUNT(*)
FROM Financial_Assistance
WHERE AidSource_Charities_Donations = 'Yes'
UNION ALL
SELECT 'Friends/Family', COUNT(*)
FROM Financial_Assistance
WHERE AidSource_Friends_Family = 'Yes'
UNION ALL
SELECT 'Religious Organizations', COUNT(*)
FROM Financial_Assistance
WHERE AidSource_Religious_Organizations = 'Yes';



-- 5. Analysis of mobile transactions and government policies

-- Impact of COVID-19 on mobile transactions
SELECT Mobile_Money_Activity, COUNT(*) AS total
FROM Economical_Impact
GROUP BY Mobile_Money_Activity
ORDER BY total DESC;

-- Breakdown of COVID loans granted
SELECT COVID_Loans, COUNT(*) AS total
FROM Economical_Impact
GROUP BY COVID_Loans;

-- Government priorities in the crisis
SELECT Government_Priority, COUNT(*) AS total
FROM Economical_Impact
GROUP BY Government_Priority
ORDER BY total DESC;