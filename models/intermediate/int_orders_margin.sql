SELECT 
DISTINCT(orders_id) as orders_id,
date_date,
SUM(revenue) as revenue,
SUM (quantity) as quantity,
SUM(purchase_price) as purchase_price,
SUM (margin) as margin

,ROUND(SUM (margin) + SUM(s.shipping_fee)- SUM(s.log_cost) + SUM( s.ship_cost),2) AS operational_margin
FROM {{ ref('int_sales_margin') }}
 LEFT JOIN {{ ref('stg_raw_ship') }} s
     USING(orders_id)
 GROUP BY orders_id, date_date
 ORDER BY orders_id desc