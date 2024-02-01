with products as (
    select
        pk,
        id,
        ingredients,
        name as product_name
    from 
        {{ source('apjuice', 'products') }}
)

select 
    *
from 
    products