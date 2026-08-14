{{ config(materialized = 'table') }}

with sales_order_header as (

    select *
    from {{ ref('stg_sales_order_header') }}

)

select *
from sales_order_header