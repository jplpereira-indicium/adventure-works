{{ config(materialized = 'table') }}

with sales_order_detail as (

    select *
    from {{ ref('stg_sales_order_detail') }}

)

, full_sales_order_detail as (

    select
        sales_order_detail.fk_sales_order
        ,sales_order_detail.carrier_tracking_number
        ,sales_order_detail.order_quantity
        ,sales_order_detail.fk_product
        ,sales_order_detail.fk_special_offer
        ,sales_order_detail.unit_price
        ,sales_order_detail.unit_price_discount
        ,cast(sales_order_detail.order_quantity * sales_order_detail.unit_price as double) as product_gross_value
        ,cast(sales_order_detail.order_quantity * (sales_order_detail.unit_price - sales_order_detail.unit_price_discount) as double) as product_net_value
    from sales_order_detail

)

select *
from full_sales_order_detail