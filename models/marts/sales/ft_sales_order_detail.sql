{{ config(materialized = 'table') }}

with sales_order_detail as (

    select *
    from {{ ref('int_ft_sales_order_detail') }}

)

select *
from sales_order_detail
