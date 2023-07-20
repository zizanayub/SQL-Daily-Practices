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

#### Query
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


#### Total time taken: 07:12 min

#### Approaches:

1. SELECT the required columns with `WHERE` clause equals to 13. Order the outcomes by targets. Rank the outputs by `DENSE_RANK()` funtion.
Here, I needed to rank the targets manager wise. So, `PARTITION BY manager_id` and then `ORDER BY target DESC` as maximum targets achievers will be on top.

2. Take the whole query of number#1 approach in a subquery named `employees_by_target` and select `first_name` and `target` again. But now we need only who ranked the top. So, `WHERE ranked_employees = 1`. BOOM! 
