{{ config(materialized = 'table') }}

with sales_order as (

    select *
    from {{ ref('int_ft_sales_order') }}

)

select *
from sales_order
