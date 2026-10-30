
-- Inventory vs Retail Performance Analysis
-- Examine warehouse stock indicators alongside
-- retail revenue and gross profit in 2026.

WITH warehouse_stock_summary AS (
    SELECT
        warehouse_id,

        COUNT(*) AS total_inventory_observations,

        COUNTIF(
            stock_on_hand <= reorder_point
        ) AS critical_stock_observations,

        ROUND(
            SAFE_DIVIDE(
                COUNTIF(stock_on_hand <= reorder_point),
                COUNT(*)
            ) * 100,
            2
        ) AS critical_stock_percentage

    FROM `nusamart.inventory`

    WHERE EXTRACT(YEAR FROM snapshot_date) = 2026

    GROUP BY warehouse_id
),

retail_sales_summary AS (
    SELECT
        st.warehouse_id,

        SUM(s.net_amount) AS total_revenue_2026,

        SUM(
            s.net_amount - (s.quantity * p.unit_cost)
        ) AS total_gross_profit_2026

    FROM `nusamart.sales` AS s

    JOIN `nusamart.products` AS p
        ON s.product_id = p.product_id

    JOIN `nusamart.stores` AS st
        ON s.store_id = st.store_id

    WHERE EXTRACT(YEAR FROM s.transaction_date) = 2026

    GROUP BY st.warehouse_id
)

SELECT
    w.warehouse_id,
    w.warehouse_name,
    w.city,

    ws.critical_stock_percentage,

    rs.total_revenue_2026,
    rs.total_gross_profit_2026

FROM `nusamart.warehouses` AS w

JOIN warehouse_stock_summary AS ws
    ON w.warehouse_id = ws.warehouse_id

JOIN retail_sales_summary AS rs
    ON w.warehouse_id = rs.warehouse_id

ORDER BY
    ws.critical_stock_percentage DESC;
