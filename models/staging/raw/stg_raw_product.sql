SELECT products_id,
CAST (purchSE_PRICE AS FLOAT64) as purchase_price

FROM {{ source('raw', 'product') }}