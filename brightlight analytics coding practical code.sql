SELECT
  *
FROM
  "SHOPPING_TRENDS"."PUBLIC"."SHOPPINGTRENDS_DB"
LIMIT
  10;

  select
        "CUSTOMER_ID",
         SIZE,
         PURCHASE_AMOUNT,
         "ITEM_PURCHASED"
  from shoppingtrends_db
  where SIZE IS NULL AND PURCHASE_AMOUNT > 50;

  SELECT 
    COALESCE('SEASON', 'Unknown Season') AS SEASON,
    COUNT(*) AS Total_Purchases
FROM SHOPPINGTRENDS_DB
GROUP BY COALESCE(SEASON, 'Unknown Season');

SELECT 
    COALESCE('PAYMENT_METHOD', 'Not Provided') AS Payment_Method,
    COUNT(DISTINCT "CUSTOMER_ID") AS Customer_Count
FROM shoppingtrends_db
GROUP BY COALESCE("PAYMENT_METHOD", 'Not Provided');

SELECT 
    CUSTOMER_ID, 
    PROMO_CODE_USED, 
    ITEM_PURCHASED, 
    CAST(REVIEW_RATING AS DECIMAL(10,2)) AS REVIEW_RATING_NUM
FROM shoppingtrends_db 
WHERE PROMO_CODE_USED IS NULL 
    AND CAST(REVIEW_RATING AS DECIMAL(10,2)) < 3.0;



SELECT 
    "SHIPPING_TYPE",
    AVG(COALESCE(PURCHASE_AMOUNT, 0)) AS Average_Purchase_Amount
FROM shoppingtrends_db
GROUP BY "SHIPPING_TYPE";

SELECT 
    LOCATION,
    COUNT(*) AS Total_Purchased
FROM shoppingtrends_db
WHERE PAYMENT_METHOD IS NOT NULL
GROUP BY LOCATION
HAVING COUNT(*) > 5;

SELECT 
    "CUSTOMER_ID",
    COALESCE(purchase_amount, 0) AS purchase_amount,
    CASE 
        WHEN COALESCE(purchase_amount, 0) > 80 THEN 'High'
        WHEN COALESCE(purchase_amount, 0) BETWEEN 50 AND 80 THEN 'Medium'
        ELSE 'Low'
    END AS Spender_Category
FROM shoppingtrends_db;

SELECT 
    CUSTOMER_ID,
    COLOR,
    PREVIOUS_PURCHASES
FROM shoppingtrends_db
WHERE PREVIOUS_PURCHASES IS NULL 
    AND COLOR IS NOT NULL;

SELECT 
    COALESCE(FREQUENCY_OF_PURCHASES, 'Unknown') AS Frequency,
    SUM(COALESCE(purchase_amount, 0)) AS Total_Purchase_Amount
FROM shoppingtrends_db
GROUP BY COALESCE(FREQUENCY_OF_PURCHASES, 'Unknown');

SELECT 
    CATEGORY,
    COUNT(*) AS Total_Purchases
FROM shoppingtrends_db
WHERE CATEGORY IS NOT NULL
GROUP BY CATEGORY;

SELECT 
    Location,
    SUM(COALESCE(purchase_amount, 0)) AS Total_Purchase_Amount
FROM shoppingtrends_db
GROUP BY Location
ORDER BY Total_Purchase_Amount DESC
LIMIT 5;


SELECT 
    GENDER,
    SIZE,
    COUNT(*) AS Null_COLOR_Count
FROM SHOPPINGTRENDS_DB
WHERE COLOR IS NULL
GROUP BY GENDER, SIZE;

SELECT 
    Item_Purchased,
    COUNT(*) AS NULL_Shipping_Type_Count
FROM shoppingtrends_db
WHERE Shipping_Type IS NULL
GROUP BY Item_Purchased
HAVING COUNT(*) > 3;

SELECT 
    PAYMENT_METHOD,
    COUNT(*) AS Missing_REVIEW_RATING_Count
FROM shoppingtrends_db
WHERE REVIEW_RATING IS NULL
GROUP BY PAYMENT_METHOD;

SELECT 
    COLOR,
    AVG(AGE) AS Average_AGE
FROM shoppingtrends_db
WHERE COLOR IS NULL
GROUP BY COLOR
HAVING COUNT(*) >= 2;


SELECT 
    Category,
    AVG(COALESCE(REVIEW_RATING, 0)) AS Average_REVIEW_RATING
FROM shoppingtrends_db
GROUP BY Category
HAVING AVG(COALESCE(REVIEW_RATING, 0)) > 3.5;

 SELECT 
    CASE 
        WHEN "SHIPPING_TYPE" IN ('Express', 'Next Day Air') THEN 'Fast'
        WHEN "SHIPPING_TYPE" = 'Standard' THEN 'Slow'
        ELSE 'Other'
    END AS DELIVERY_SPEED,
    COUNT(DISTINCT "CUSTOMER_ID") AS Customer_Count
FROM shoppingtrends_db
GROUP BY DELIVERY_SPEED;



SELECT 
    CUSTOMER_ID,
    PURCHASE_AMOUNT,
    PROMO_CODE_USED
FROM shoppingtrends_db
WHERE PURCHASE_AMOUNT IS NULL AND PROMO_CODE_USED = 'Yes';

SELECT 
    Location,
    MAX(COALESCE(PREVIOUS_PURCHASES, 0)) AS Max_PREVIOUS_PURCHASES,
    AVG(REVIEW_RATING) AS Average_Review_Rating
FROM shoppingtrends_db
GROUP BY Location
HAVING AVG(REVIEW_RATING) > 4.0;




SELECT 
    CUSTOMER_ID,
    SHIPPING_TYPE,
    PURCHASE_AMOUNT,
    ITEM_PURCHASED
FROM shoppingtrends_db
WHERE SHIPPING_TYPE IS NULL 
  AND PURCHASE_AMOUNT BETWEEN 30 AND 70;
