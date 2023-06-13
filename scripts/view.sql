CREATE VIEW bb.customer_data_masked AS
SELECT 
    customer_id, 
    CASE WHEN length(card_no) >= 16 THEN CONCAT(SUBSTRING(card_no,1,4), '********', SUBSTRING(card_no,-4)) ELSE card_no END AS card_no_masked,
    CASE WHEN length(email) > 3 THEN CONCAT(SUBSTRING(email,1,3), '****@', SUBSTRING(email, -3)) ELSE email END AS email_masked,
    reliability
FROM bb.customer;

CREATE VIEW bb.deal_data_masked AS
SELECT
    dealer_id,
    date,
    lot_id,
    drop_point,
    CASE WHEN length(customer_name) > 3 THEN CONCAT(SUBSTRING(customer_name,1,3), '****') ELSE customer_name END AS customer_name_masked,
    cash_amount
FROM bb.deal
JOIN bb.customer ON bb.deal.customer_id = bb.customer.customer_id;

CREATE VIEW bb.lab_statistics AS
SELECT 
    bb.lab.lab_id,
    bb.lab.loc,
    COUNT(DISTINCT bb.product.lot_id) AS num_products,
    COUNT(DISTINCT bb.cook.cook_id) AS num_cooks,
    COUNT(DISTINCT bb.hardware.hardware_id) AS num_hardware
FROM bb.lab
LEFT JOIN bb.product ON bb.lab.lab_id = bb.product.lab_id
LEFT JOIN bb.cook ON bb.lab.lab_id = bb.cook.lab_id
LEFT JOIN bb.hardware ON bb.lab.lab_id = bb.hardware.lab_id
GROUP BY bb.lab.lab_id, bb.lab.loc;

CREATE VIEW bb.dealer_sales AS
SELECT 
    bb.dealer.nm AS dealer_name,
    COUNT(DISTINCT bb.deal.customer_id) AS num_customers,
    SUM(bb.deal.cash_amount) AS total_sales
FROM bb.dealer
JOIN bb.product ON bb.dealer.lot_id = bb.product.lot_id
JOIN bb.deal ON bb.product.lot_id = bb.deal.lot_id
GROUP BY bb.dealer.nm;

CREATE VIEW bb.cook_statistics AS
SELECT 
    bb.cook.nm AS cook_name,
    AVG(bb.cook.avg_percentage) AS avg_discount,
    COUNT(DISTINCT bb.deal.lot_id) AS num_products,
    COUNT(DISTINCT bb.product.lot_id) AS num_cooked_products
FROM bb.cook
LEFT JOIN bb.deal ON bb.cook.cook_id = bb.deal.cook_id
LEFT JOIN bb.product ON bb.cook.lab_id = bb.product.lab_id
GROUP BY bb.cook.nm;

CREATE VIEW bb.top_reliable_dealers AS
SELECT 
    d.nm as dealer_name, 
    COUNT(c.customer_id) as num_customers 
FROM 
    bb.dealer d 
    JOIN bb.customer c ON d.dealer_id = c.dealer_id 
GROUP BY 
    d.nm 
HAVING 
    COUNT(c.customer_id) >= 5 
ORDER BY 
    COUNT(c.customer_id) DESC;

