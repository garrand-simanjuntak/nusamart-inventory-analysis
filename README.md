
# NusaMart: Warehouse Inventory & Retail Performance Analysis

**SQL | Google BigQuery | Inventory Analytics | Group Project**

## Project Overview

This project was conducted as part of the FGSeara Data Analytics Bootcamp. Our team analyzed NusaMart's retail operations to identify business performance issues and develop data-driven recommendations.

My primary contribution focused on warehouse inventory analysis, including SQL query development, analysis of stock conditions, and presentation of findings.

## 1. Problem

NusaMart faced operational concerns involving inventory shortages and uneven warehouse stock distribution.

The analysis focused on three questions:

- Which warehouses have the highest proportion of inventory records at or below their reorder points?
- Which products repeatedly experience low-stock conditions?
- How do warehouse stock indicators relate to retail sales performance?

## 2. Data

The analysis used the NusaMart retail dataset provided for the FGSeara bootcamp project.

Relevant tables included:

| Table | Records | Description |
|---|---:|---|
| inventory | 5,976 | Warehouse inventory snapshots |
| warehouses | 4 | Warehouse information |
| stores | 20 | Store locations and warehouse assignments |
| sales | 86,673 | Transaction line items |
| products | 83 | Product information and categories |

Key inventory fields included `warehouse_id`, `product_id`, `snapshot_date`, `stock_on_hand`, and `reorder_point`.

## 3. Approach

The analysis was conducted using SQL in Google BigQuery.

1. **Warehouse Stock Health:** Calculated the proportion of inventory records at or below the reorder point for each warehouse.
2. **Understock Analysis:** Identified products in Surabaya warehouse that repeatedly fell below their reorder points.
3. **Product Sales Analysis:** Identified top-selling products in East Java & Bali.
4. **Inventory and Retail Performance:** Combined warehouse inventory indicators with revenue data from associated stores to examine potential operational risks.

SQL techniques included JOIN, Common Table Expressions (CTEs), conditional aggregation, COUNTIF, and GROUP BY.

## 4. Results

### Warehouse Stock Health

- Surabaya warehouse (WH03) recorded the highest proportion of inventory observations at or below the reorder point, at **17.67%**.
- Cikarang warehouse (WH01) recorded **3.01%**.
- Semarang warehouse (WH02) recorded **2.61%**.

### Repeated Low-Stock Conditions

Product P020 in Surabaya warehouse was below its reorder point in 4 out of 6 monthly inventory snapshots (**66.67%**).

### Inventory and Retail Performance

- Retail stores associated with Surabaya warehouse generated approximately **Rp326.86 million** in revenue during the analyzed 2026 period.
- Retail stores associated with Cikarang warehouse generated approximately **Rp905.48 million**.

These observations indicate potential differences in inventory conditions and retail performance across warehouse service areas. However, the analysis does not establish a causal relationship between low stock and revenue.

## 5. Impact & Recommendations

Based on the findings, the analysis proposed:

- **Inventory Monitoring:** Prioritize inventory reviews at Surabaya warehouse, particularly for products that repeatedly fall below their reorder points.
- **Stock Reallocation:** Evaluate potential inter-warehouse stock transfers after confirming product availability, demand, and distribution costs.
- **Supplier Evaluation:** Investigate replenishment frequency and supplier performance for products with repeated low-stock conditions.
- **Operational Monitoring:** Track inventory risk indicators alongside sales performance to support future replenishment decisions.

These recommendations were developed from the project analysis and have not been evaluated through operational implementation.

## 6. Tools & Links

- **SQL:** Google BigQuery (GoogleSQL)
- **Presentation:** Team project slide deck
- **Repository:** This GitHub repository

## My Contributions

This was a collaborative group project completed by Group 1 of the FGSeara Data Analytics Bootcamp.

My responsibilities included:

- Developing SQL queries for warehouse inventory analysis.
- Analyzing stock levels, reorder point indicators, and related retail performance.
- Interpreting SQL query outputs and preparing the inventory analysis section of the final presentation.

The broader retail business analysis and final presentation were completed collaboratively with the project team.

## Limitations

- Inventory snapshots do not directly measure the duration of actual stockouts.
- Reorder point indicators represent inventory risk rather than confirmed lost sales.
- Differences in revenue across warehouse service areas may be affected by other factors, including store count, customer demand, and regional characteristics.
- Business recommendations have not been implemented or tested.
