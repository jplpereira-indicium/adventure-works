{{ config(materialized = 'table') }}

with sales_order_reason as (

    select *
    from {{ ref('stg_sales_order_reason') }}

)

, sales_reason as (

    select *
    from {{ ref('stg_sales_reason') }}

)

, full_sales_reason as (

    select
        sales_order_reason.fk_sales_order
        ,sales_reason.pk_sales_reason
        ,sales_reason.sales_reason_name
        ,sales_reason.reason_type
    from sales_order_reason
    left join sales_reason
        on sales_order_reason.fk_sales_reason = sales_reason.pk_sales_reason
)

select *
from full_sales_reason
