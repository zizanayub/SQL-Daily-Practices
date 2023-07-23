/*
You are given a table of product launches by company by year. Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. 
Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.
*/

SELECT 
    company_name,
    COUNT(CASE WHEN year = 2020 THEN 1 END) -
    COUNT(CASE WHEN year = 2019 THEN 1 END ) AS total_car_launch
    FROM car_launches
    GROUP BY company_name
    ORDER BY company_name;
