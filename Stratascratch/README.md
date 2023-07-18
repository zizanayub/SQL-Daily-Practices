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


