SELECT *
FROM pet_supplies;

SELECT product_id, COUNT(*)
FROM pet_supplies
GROUP BY product_id;

SELECT category, SUM(repeate_purchase::INTEGER) AS total_repeat_purchase
FROM pet_supplies
GROUP BY category
ORDER BY 2 DESC;

SELECT category, SUM(sales::NUMERIC) AS total_sales
FROM pet_supplies
GROUP BY category;

SELECT category, SUM(repeate_purchase::INTEGER) AS total_repeat_purchase, SUM(sales::NUMERIC) AS total_sales
FROM pet_supplies
GROUP BY category;

SELECT MAX(sales::NUMERIC)
FROM pet_supplies;

SELECT category, COUNT(*)
FROM (
	SELECT product_id, category, sales::NUMERIC
	FROM pet_supplies
	WHERE sales::NUMERIC > 2000) AS sub
GROUP BY category
ORDER BY category;