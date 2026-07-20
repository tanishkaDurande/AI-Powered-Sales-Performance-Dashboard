CREATE TABLE sales_data (
    date DATE,
    region VARCHAR(20),
    lead_source VARCHAR(50),
    leads_generated INT,
    demo_calls INT,
    deals_closed INT,
    revenue NUMERIC,
    marketing_spend NUMERIC,
    sales_hours_spent INT,
    conversion_rate NUMERIC,
    win_rate NUMERIC,
    revenue_per_lead NUMERIC,
    cost_per_lead NUMERIC,
    cost_per_acquisition NUMERIC
);


--data display
select * from sales_data limit 10;

--How many sales records are there?
select count(*) as total_records from sales_data ;

--How much revenue did the company generate?
select sum(revenue) as total_revenue from sales_data;

--What is the average revenue?
select avg(revenue) as average_revenue from sales_data;

--Which region earns the most revenue?
select
region,
sum(revenue) as total_revenue
from sales_data
group by region
order by total_revenue desc;

--Which region generated the highest number of leads?
select region, sum(leads_generated) 
as highest_lead 
from sales_data 
group by region
order by highest_lead desc;

--Which region has the highest average revenue per sales record?
select region, round(avg(revenue),2) as 
average_revenue 
from sales_data 
group by region 
order by average_revenue desc;

--Which lead source generated the highest revenue?
select lead_source,
sum(revenue) as total_revenue
from sales_data
group by lead_source
order by total_revenue desc;

--Which lead source generated the highest number of leads?
select lead_source, 
sum(leads_generated) as total_leads
from sales_data
group by lead_source
order by total_leads desc;

--Which sales generated more than ₹500,000 in revenue?
SELECT *
FROM sales_data
WHERE revenue > 500000;

--What are the sales records where the lead source is LinkedIn?
SELECT *
FROM sales_data
WHERE lead_source = 'LinkedIn';

--How can each sales record be categorized as High, Medium, or Low revenue?
SELECT
    revenue,
    CASE
        WHEN revenue >= 500000 THEN 'High'
        WHEN revenue >= 250000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_category
FROM sales_data;

--Which regions generated more than ₹20 million in total revenue?
SELECT
    region,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY region
HAVING SUM(revenue) > 20000000;

--Which are the top 5 highest revenue sales records?
SELECT *
FROM sales_data
ORDER BY revenue DESC
LIMIT 5;

--