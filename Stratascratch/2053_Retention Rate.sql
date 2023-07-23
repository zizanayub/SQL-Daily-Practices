/*
Find the monthly retention rate of users for each account separately for Dec 2020 and Jan 2021. 
Retention rate is the percentage of active users an account retains over a given period of time. In this case, assume the user
is retained if he/she stays with the app in any future months. For example, if a user was active in Dec 2020 and has activity 
in any future month, consider them retained for Dec. You can assume all accounts are present in Dec 2020 and Jan 2021. 
Your output should have the account ID and the Jan 2021 retention rate divided by Dec 2020 retention rate.
*/




SELECT
    account_id,
    ROUND(SUM(january_retention)/SUM(december_retention)) AS retention
FROM 
(
SELECT
    *,
    CASE WHEN date_format(last_date,"%Y-%m") > '2020-12' THEN 1 ELSE 0 END 
       AS december_retention,
    CASE WHEN date_format(last_date,"%Y-%m") > '2021-01' THEN 1 ELSE 0 END 
       AS january_retention
FROM
(
SELECT 
    account_id,
    user_id,
    MIN(date) AS first_date,
    MAX(date) AS last_date
FROM sf_events
GROUP BY account_id,user_id
) AS info_by_users
) As final_retention
GROUP BY account_id
