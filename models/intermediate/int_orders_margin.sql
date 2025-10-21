SELECT 
DISTINCT(orders_id) as orders_id,
date_date,
SUM(revenue) as revenue,
SUM (quantity) as quantity,
SUM(purchase_price) as purchase_price,
SUM (margin) as margin
FROM {{ ref('int_sales_margin') }}
GROUP BY date_date, orders_id