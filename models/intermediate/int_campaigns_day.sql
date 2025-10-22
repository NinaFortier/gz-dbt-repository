WITH int_campaigns_day AS (
    SELECT
        date_date,
        SUM(ads_cost) AS total_ads_cost,
        SUM(impression) AS total_impressions,
        SUM(click) AS total_clicks
    FROM {{ ref('int_campaigns_day') }}
    GROUP BY date_date
)

SELECT
    date_date,
    total_ads_cost,
    total_impressions,
    total_clicks
FROM {{ ref('int_campaigns_day') }}
ORDER BY date_date DESC