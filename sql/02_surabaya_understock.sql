
-- Surabaya Warehouse Understock Analysis
-- Identify products that repeatedly fall below
-- their reorder points during H1 2026.

SELECT
    product_id,

    COUNT(*) AS total_inventory_snapshots,

    COUNTIF(
        stock_on_hand < reorder_point
    ) AS understock_frequency,

    ROUND(
        SAFE_DIVIDE(
            COUNTIF(stock_on_hand < reorder_point),
            COUNT(*)
        ) * 100,
        2
    ) AS understock_percentage

FROM `nusamart.inventory`

WHERE warehouse_id = 'WH03'
    AND snapshot_date BETWEEN '2026-01-01'
                          AND '2026-06-30'

GROUP BY
    product_id

ORDER BY
    understock_percentage DESC,
    understock_frequency DESC

LIMIT 31;
