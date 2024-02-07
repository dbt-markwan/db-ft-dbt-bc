with sales_items as (
    select * from {{ ref('sales_items') }}
),
dim_locations as (
    select * from {{ ref('dim_locations') }}
),
sales as (
    select * from {{ ref('sales') }}
),
final as(
    select 
        l.country_code, 
        date_format(sales.ts, 'yyyy-MM') as sales_month, 
        sum(product_cost) as total_sales, 
        count(distinct sale_id) as number_of_sales
    from sales_items 
    join dim_locations l on sales_items.store_id = l.id
    join sales on sales_items.sale_id = sales.id
    group by l.country_code, date_format(sales.ts, 'yyyy-MM')
)

select * from final
