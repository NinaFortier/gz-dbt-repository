SELECT
om.*
, s.shipping_fee
, s.log_cost
, s.ship_cost
FROM {{ ref('int_orders_margin') }} AS om
LEFT JOIN {{ ref('stg_raw_ship')}}AS s
ON om.orders_id = s.orders_id