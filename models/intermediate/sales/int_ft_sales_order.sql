{{ config(materialized = 'table') }}

with sales_order_header as (

    select *
    from {{ ref('stg_sales_order_header') }}

)

, sales_order_detail as (

    select *
    from {{ ref('stg_sales_order_detail') }}

)

, full_sales_order as (

    select
        sales_order_header.pk_sales_order
        ,sales_order_header.revision_number
        ,sales_order_header.order_date
        ,sales_order_header.due_date
        ,sales_order_header.ship_date
        ,sales_order_header.status_number
        ,sales_order_header.is_online_order
        ,sales_order_header.purchase_order_number
        ,sales_order_header.account_number
        ,sales_order_header.fk_customer
        ,sales_order_header.fk_sales_person
        ,sales_order_header.fk_territory
        ,sales_order_header.fk_bill_to_address
        ,sales_order_header.fk_ship_to_address
        ,sales_order_header.fk_ship_method
        ,sales_order_header.fk_credit_card
        ,sales_order_header.credit_card_approval_code
        ,sales_order_header.fk_currency_rate
        ,sales_order_header.subtotal
        ,sales_order_header.tax_amount
        ,sales_order_header.freight
        ,sales_order_header.total_due
        ,sales_order_header.comment
        ,sales_order_detail.carrier_tracking_number
        ,sales_order_detail.order_quantity
        ,sales_order_detail.fk_product
        ,sales_order_detail.fk_special_offer
        ,sales_order_detail.unit_price
        ,sales_order_detail.unit_price_discount
        ,cast(sales_order_detail.order_quantity * sales_order_detail.unit_price as double) as product_gross_value
        ,cast(sales_order_detail.order_quantity * (sales_order_detail.unit_price - sales_order_detail.unit_price_discount) as double) as product_net_value
    from sales_order_header
    left join sales_order_detail
        on sales_order_header.pk_sales_order = sales_order_detail.fk_sales_order

)

select *
from full_sales_order