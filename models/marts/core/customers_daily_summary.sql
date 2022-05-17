Select
    {{ dbt_utils.surrogate_key(['customer_id', 'order_date']) }} as sk_id,
    customer_id,
    order_date,
    count(*) as qtd
from {{ ref('stg_orders') }}
group by 1, 2, 3