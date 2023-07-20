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
