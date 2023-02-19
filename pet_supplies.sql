DROP TABLE IF EXISTS pet_supplies;

CREATE TABLE pet_supplies(
	product_id BIGINT,
	category VARCHAR,
	animal VARCHAR,
	size VARCHAR,
	price VARCHAR,
	sales VARCHAR,
	rating VARCHAR,
	repeate_purchase VARCHAR
)

COPY pet_supplies
FROM '/Users/jdo/Documents/DataCamp/Data Science Associate Certification/pet_supplies_2212.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM pet_supplies;

-- Data Cleaning
-- category
SELECT DISTINCT (category)
FROM pet_supplies;

UPDATE pet_supplies
SET category = 'Unknown'
WHERE category = '-';

-- size
SELECT DISTINCT (size)
FROM pet_supplies;

SELECT DISTINCT (INITCAP (size))
FROM pet_supplies;

UPDATE pet_supplies
SET size = INITCAP(size);

-- price
SELECT DISTINCT price
FROM pet_supplies
ORDER BY price DESC;

UPDATE pet_supplies
SET price = REPLACE(price, 'unlisted', '0');

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price::NUMERIC ASC)
FROM pet_supplies
WHERE price <> '0';

UPDATE pet_supplies
SET price = REPLACE(price, '0', '28.065');

SELECT ROUND(price::NUMERIC, 2)
FROM pet_supplies;

UPDATE pet_supplies
SET price = ROUND(price::NUMERIC, 2);

-- sales
SELECT DISTINCT sales
FROM pet_supplies
ORDER BY sales ASC;

UPDATE pet_supplies
SET sales = ROUND(sales::NUMERIC, 2);

-- rating
SELECT DISTINCT rating, COUNT(rating)
FROM pet_supplies
GROUP BY rating
ORDER BY rating ASC;

UPDATE pet_supplies
SET rating = '0'
WHERE rating LIKE 'NA';

-- repeat_purchase
SELECT *
FROM pet_supplies
WHERE repeate_purchase IS NULL;

SELECT DISTINCT repeate_purchase
FROM pet_supplies;

UPDATE pet_supplies
SET repeate_purchase = '0'
WHERE repeate_purchase LIKE '-0';