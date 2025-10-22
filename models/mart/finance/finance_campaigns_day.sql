SELECT
    finance.date_date,
    (finance.operational_margin -int_campaigns_day.ads_cost) AS ads_margin,
   average_basket,
    operational_margin,
ads_cost,
impression,
click,
    quantity,
    revenue,
    purchase_price,
    margin,
    shipping_fee,
    log_cost,
    ship_cost

FROM {{ ref('finance_days') }} as finance
LEFT JOIN {{ ref('int_campaigns_day') }} as int_campaigns_day
    ON finance.date_date = int_campaigns_day.date_date

ORDER BY date_date DESC