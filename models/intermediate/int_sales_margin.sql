WITH purchase AS (
  SELECT
    s.*,
    purchase_price,
  FROM {{ ref('sales') }} AS s
  LEFT JOIN {{ ref('stg_raw_product') }} AS p
    ON s.products_id = p.products_id
)
SELECT
*
  ,(revenue - purchase_price) AS margin
FROM purchase