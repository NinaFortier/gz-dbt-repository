SELECT
    date_date AS date,
    (operational_margin - ads_cost) AS ads_margin,
   average_basket,
    operational_margin,
    ads_cost,
   ads_impression,
    ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost,
    ship_cost

FROM {{ ref('finance_days') }}
LEFT JOIN {{ ref('int_campaigns_day') }}
    ON date_date = date_date

ORDER BY date_date DESC