
-- Warehouse Stock Health Analysis
-- Percentage of inventory observations at or below
-- the reorder point for each warehouse in 2026.

SELECT
    i.warehouse_id,
    w.warehouse_name,
    w.city,

    COUNT(*) AS total_inventory_observations,

    COUNTIF(
        i.stock_on_hand <= i.reorder_point
    ) AS critical_stock_observations,

    ROUND(
        SAFE_DIVIDE(
            COUNTIF(i.stock_on_hand <= i.reorder_point),
            COUNT(*)
        ) * 100,
        2
    ) AS critical_stock_percentage

FROM `nusamart.inventory` AS i

JOIN `nusamart.warehouses` AS w
    ON i.warehouse_id = w.warehouse_id

WHERE EXTRACT(YEAR FROM i.snapshot_date) = 2026

GROUP BY
    i.warehouse_id,
    w.warehouse_name,
    w.city

ORDER BY
    critical_stock_percentage DESC;
