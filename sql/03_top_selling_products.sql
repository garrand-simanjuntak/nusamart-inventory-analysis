
-- Top-Selling Products Analysis
-- Identify the 10 best-selling products by units sold
-- in East Java & Bali during H1 2026.

SELECT
    s.product_id,
    p.category,
    p.sub_category,
    p.brand,

    SUM(s.quantity) AS total_units_sold,

    SUM(s.net_amount) AS total_revenue,

    COUNT(DISTINCT s.transaction_id) AS total_transactions

FROM `nusamart.sales` AS s

JOIN `nusamart.products` AS p
    ON s.product_id = p.product_id

JOIN `nusamart.stores` AS st
    ON s.store_id = st.store_id

WHERE
    st.region = 'Jawa Timur & Bali'

    AND s.transaction_date BETWEEN '2026-01-01'
                               AND '2026-06-30'

GROUP BY
    s.product_id,
    p.category,
    p.sub_category,
    p.brand

ORDER BY
    total_units_sold DESC

LIMIT 10;
