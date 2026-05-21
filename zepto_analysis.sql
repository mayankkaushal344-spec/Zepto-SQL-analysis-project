SELECT *
 from zepto_v2 
 limit 10;

-- describe database

 Describe zepto_v2;

-- total product

 SELECT count(*) as Total_products
 from zepto_v2;

-- different categories

  SELECT DISTINCT Category
 FROM zepto_v2;

-- product per category

SELECT Category,
count(*) as total_products
FROM zepto_v2
GROUP BY Category
ORDER BY total_products DESC;


-- Average dsicount by category

SELECT Category,
AVG(discountPercent) AS avg_discount
FROM zepto_v2
GROUP by Category
ORDER by avg_discount DESc;


-- conversion from paise to rupees

SELECT name,
       Category,
       mrp / 100 AS original_price_rs,
       discountedSellingPrice / 100 AS selling_price_rs,
       discountPercent
FROM zepto_v2
LIMIT 10;

-- most expensive product

SELECT name, mrp
FROM zepto_v2
ORDER BY mrp DESC; 


-- data exploration
SELECT * FROM zepto_v2
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;


-- data cleaning
SELECT * 
FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE 
FROM zepto_v2
where mrp = 0;

-- out of stock product

SELECT count(*) as out_of_product
FROM zepto_v2
WHERE outOfStock = 'true';


-- average selling price


SELECT AVG(discountedSellingPrice) as avg_selling_price
FROM zepto_v2
ORDER by avg_selling_price;


-- Revenue potential by category

SELECT SUM(discountedSellingPrice * quantity) as estimated_revenue
FROM zepto_v2
GROUP by Category
ORDER by estimated_revenue DESC;



-- Top category by inventory

SELECT Category, SUM(availableQuantity) as total_inventory
FROM zepto_v2
GROUP BY Category
ORDER by total_inventory DESC;



-- Which categories generate the highest potential revenue?


SELECT Category,
       ROUND(SUM((discountedSellingPrice / 100) * quantity), 2) AS estimated_revenue
FROM zepto_v2
GROUP BY Category
ORDER BY estimated_revenue DESC;

-- insight : Helps identify top-performing product categories.


-- Which products have the highest discounts?

SELECT name,
       Category,
       mrp / 100 AS original_price,
       discountedSellingPrice / 100 AS selling_price,
       discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

-- insight : Shows aggressive discounting strategy products.



-- Which categories are most frequently out of stock?

SELECT Category,
       COUNT(*) AS out_of_stock_products
FROM zepto_v2
WHERE outOfStock = 'TRUE'
GROUP BY Category
ORDER BY out_of_stock_products DESC;


-- insight : Identifies supply chain or inventory issues.


-- Which products contribute highest inventory value?

SELECT name,
       ROUND((discountedSellingPrice / 100) * availableQuantity, 2) AS inventory_value
FROM zepto_v2
ORDER BY inventory_value DESC
LIMIT 10;

-- insight : Shows high-value inventory products needing close monitoring.


-- Average discount offered by each category

SELECT Category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto_v2
GROUP BY Category
ORDER BY avg_discount DESC;

-- insight : Helps evaluate category-wise pricing strategy.


-- Which categories have the largest inventory?

SELECT Category,
       SUM(availableQuantity) AS total_inventory
FROM zepto_v2
GROUP BY Category
ORDER BY total_inventory DESC;

-- insight : Shows inventory-heavy categories.



-- Top premium products based on MRP

SELECT name,
       Category,
       Round(mrp / 100,2) AS mrp_rs
FROM zepto_v2
ORDER BY mrp DESC
LIMIT 10;

-- insight : Identifies luxury/premium product segment.


-- Price difference between original and selling price

SELECT name,
       ROUND(mrp / 100, 2) AS original_price,
       ROUND(discountedSellingPrice / 100, 2) AS selling_price,
       ROUND((mrp - discountedSellingPrice) / 100, 2) AS discount_amount
FROM zepto_v2
ORDER BY discount_amount DESC
LIMIT 10;


-- insight : Shows products where company gives maximum monetary discount.


-- Category-wise average selling price

SELECT Category,
       ROUND(AVG(discountedSellingPrice / 100), 2) AS avg_selling_price
FROM zepto_v2
GROUP BY Category
ORDER BY avg_selling_price DESC;

-- insight : Identifies expensive vs budget-oriented categories.