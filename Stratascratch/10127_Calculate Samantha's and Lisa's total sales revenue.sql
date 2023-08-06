USE exercises;



-- CREATE TABLE
CREATE TABLE sales_performance (
salesperson VARCHAR(40),
widget_sales int,
sales_revenue int,
id int);



-- Insert INTO
INSERT INTO sales_performance VALUES
('Bobby', 661, 33050, 2),
('Samantha', 1006, 50300, 3),
('Taylor', 984, 49200, 4),
('Tom', 403, 20150, 5),
('Pat', 715, 35750, 6),
('Lisa', 1247, 62350, 7);



-- Total sales of Samantha and Lisa Individually
SELECT salesperson, SUM(sales_revenue) AS total_sales_revenue
FROM sales_performance
WHERE salesperson IN ('Samantha', 'Lisa')
GROUP BY salesperson;



-- Total sales of Samantha and Lisa (Both)
SELECT
    "Samatha and Lisa" AS Salespersons,
    SUM(CASE WHEN salesperson = 'Samantha' THEN sales_revenue
             WHEN salesperson = 'Lisa' THEN sales_revenue
             ELSE 0 END) AS "Total Sales Revenue"
FROM sales_performance;
