WITH ship AS (
  SELECT
    s.orders_id,
    s.shipping_fee,
    s.logCost AS log_cost,
    CAST(s.ship_cost AS FLOAT64) AS ship_cost,
    om.margin
  FROM {{ source('raw', 'ship') }} AS s
  LEFT JOIN {{ ref('int_orders_operational') }} AS om
    ON s.orders_id = om.orders_id
)
SELECT
  orders_id,
  shipping_fee,
  log_cost,
  ship_cost,
  margin,
  (margin + shipping_fee - log_cost - ship_cost) AS operational_margin
FROM ship