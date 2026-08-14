{{ config(materialized = 'table') }}

with
    sales_order_header as (

        select *
        from {{ ref('stg_sales_order_header') }}

    )

    , selected_sales_order_header as (

        select
            pk_sales_order
            ,revision_number
            ,cast(order_date as date) as order_date
            ,cast(due_date as date) as due_date
            ,cast(ship_date as date) as ship_date
            ,status_number
            ,is_online_order
            ,purchase_order_number
            ,account_number
            ,fk_customer
            ,fk_sales_person
            ,fk_territory
            ,fk_bill_to_address
            ,fk_ship_to_address
            ,fk_ship_method
            ,fk_credit_card
            ,credit_card_approval_code
            ,fk_currency_rate
            ,subtotal
            ,tax_amount
            ,freight
            ,total_due
        from sales_order_header
    ) 

select *
from selected_sales_order_header