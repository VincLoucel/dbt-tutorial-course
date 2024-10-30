
With order_details AS 
(
    SELECT
        order_id, 
        count(*) AS num_of_items_in_order
    FROM {{ ref('stg_ecommerce__order_items')}}
        GROUP BY 1
)


SELECT 
    orders.order_id,
    orders.num_items_ordered,
    order_details.num_of_items_in_order
FROM {{ ref('stg_ecommerce__orders') }} orders
FULL OUTER JOIN order_details USING(order_id)
WHERE
    orders.order_id is NULL
    OR order_details IS NULL
    OR orders.num_items_ordered <> order_details.num_of_items_in_order