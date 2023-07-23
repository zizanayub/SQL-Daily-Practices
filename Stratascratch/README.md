# 18/07/2023


## ID-9917(Easy)- Salesforce, Glassdoor

Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.



![image](https://github.com/zizanayub/SQL-Daily-Practices/assets/65456659/d1fb43bb-847e-4080-915f-ee3352ba3e12)



Solution: 

```SQL
SELECT
    department,
    first_name,
    salary,
    AVG(salary) OVER (Partition by department) AS "Average Salary Per Department"

FROM employee
```




# 20/07/2023

## ID-9905(Medium)- Highest Target Under Manager

#### Companies asked: Salesforce


Find the highest target achieved by the employee or employees who works under the manager id 13. Output the first name of the employee and target achieved. The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

#### Table

![image](https://github.com/zizanayub/SQL-Daily-Practices/assets/65456659/848faa32-c9ff-4b70-8cb5-41ad55f4cb41)


####  Query
```SQL
SELECT
    first_name,
    target
FROM
(
SELECT 
    first_name,
    target,
    DENSE_RANK() OVER (PARTITION BY manager_id
                       ORDER BY target DESC) AS ranked_employees
FROM salesforce_employees e
WHERE manager_id = 13
ORDER BY target DESC) AS employees_by_target
WHERE ranked_employees = 1;
```

#### Output:
![image](https://github.com/zizanayub/SQL-Daily-Practices/assets/65456659/69f558cd-ebb2-4743-b502-dc349af5e21c)


####  Total time taken: 07:12 min

#### Approaches:

1. SELECT the required columns with `WHERE` clause equals to 13. Order the outcomes by targets. Rank the outputs by `DENSE_RANK()` funtion.
Here, I needed to rank the targets manager wise. So, `PARTITION BY manager_id` and then `ORDER BY target DESC` as maximum targets achievers will be on top.

2. Take the whole query of number#1 approach in a subquery named `employees_by_target` and select `first_name` and `target` again. But now we need only who ranked the top. So, `WHERE ranked_employees = 1`. BOOM!



# 23/07/2023

## ID-10318(Medium)- New Products

#### Companies asked: Tesla, Salesforce


You are given a table of product launches by company by year. Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.


![image](https://github.com/zizanayub/SQL-Daily-Practices/assets/65456659/7e10b99a-8114-4bb7-bd52-457c4cd1c754)


#### Query:

```SQL
SELECT 
    company_name,
    COUNT(CASE WHEN year = 2020 THEN 1 END) -
    COUNT(CASE WHEN year = 2019 THEN 1 END ) AS total_car_launch
    FROM car_launches
    GROUP BY company_name
    ORDER BY company_name;
```

#### Output: 
![image](https://github.com/zizanayub/SQL-Daily-Practices/assets/65456659/1728aab1-6e60-404f-bae9-34afbbcd4abb)


#### Total Time Taken: 14 min

#### Approaches:

1. First select the company name and count the difference between the launched product counts in 2 years. We wrote
`COUNT(CASE WHEN year = 2020 THEN 1 END` and same for previous year for finding the launched cars counts. So each row in the table shows us the information about
each new launched car.

1. 💡 You can use `CASE` statement with 1 condition also. Here is this example. 

2. GROUP the whole query by `company_name`





## ID-2053(Hard)- Retention Rate

Companies Asked: Meta, Salesforce

Find the monthly retention rate of users for each account separately for Dec 2020 and Jan 2021. Retention rate is the percentage of active users an account retains over a given period of time. In this case, assume the user is retained if he/she stays with the app in any future months. For example, if a user was active in Dec 2020 and has activity in any future month, consider them retained for Dec. You can assume all accounts are present in Dec 2020 and Jan 2021. Your output should have the account ID and the Jan 2021 retention rate divided by Dec 2020 retention rate.


![image](https://github.com/zizanayub/SQL-Daily-Practices/assets/65456659/f8155979-a2a9-4bff-9ecf-a5f2ca2d28d7)

Link: https://platform.stratascratch.com/coding/2053-retention-rate

#### Query:

```SQL
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
```
