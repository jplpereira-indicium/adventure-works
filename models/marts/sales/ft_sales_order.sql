{{ config(materialized = 'table') }}

with sales_order as (

    select *
    from {{ ref('int_ft_sales_order') }}

)

, credit_card as (

    select *
    from {{ ref('int_dim_sales_creditcard') }}

)

, address as (

    select *
    from {{ ref('int_dim_person_address') }}

)

, product as (

    select *
    from {{ ref('int_dim_production_product') }}

)

, full_sales_order as (

    select
        sales_order.pk_sales_order
        ,sales_order.revision_number
        ,sales_order.order_date
        ,sales_order.due_date
        ,sales_order.ship_date
        ,sales_order.status_number
        ,sales_order.is_online_order
        ,sales_order.purchase_order_number
        ,sales_order.account_number
        ,sales_order.fk_customer
        ,sales_order.fk_sales_person
        ,sales_order.fk_territory
        ,sales_order.fk_ship_method
        ,sales_order.credit_card_approval_code
        ,sales_order.fk_currency_rate
        ,sales_order.subtotal
        ,sales_order.tax_amount
        ,sales_order.freight
        ,sales_order.total_due
        ,sales_order.comment
        ,sales_order.carrier_tracking_number
        ,sales_order.order_quantity
        ,sales_order.fk_special_offer
        ,sales_order.unit_price
        ,sales_order.unit_price_discount
        ,sales_order.product_gross_value
        ,sales_order.product_net_value
        ,credit_card.pk_credit_card
        ,credit_card.card_type
        ,credit_card.card_number
        ,credit_card.expiration_month
        ,credit_card.expiration_year
        ,address.pk_address as ship_to_pk_address
        ,address.address_line_1 as ship_to_address_line_1
        ,address.address_line_2 as ship_to_address_line_2
        ,address.city as ship_to_city
        ,address.postal_code as ship_to_postal_code
        ,address.pk_state_province as ship_to_pk_state_province
        ,address.state_province_code as ship_to_state_province_code
        ,address.is_only_state_province as ship_to_is_only_state_province
        ,address.state_province_name as ship_to_state_province_name
        ,address.pk_country_region as ship_to_pk_country_region
        ,address.country_region_name as ship_to_country_region_name
        ,product.pk_product
        ,product.product_name
        ,product.product_number
        ,product.is_make
        ,product.is_finished_goods
        ,product.color
        ,product.safety_stock_level
        ,product.reorder_point
        ,product.standard_cost
        ,product.list_price
        ,product.size
        ,product.size_unit_measure_code
        ,product.weight_unit_measure_code
        ,product.weight
        ,product.days_to_manufacture
        ,product.product_line
        ,product.class
        ,product.style
        ,product.fk_product_model
        ,product.sell_start_date
        ,product.sell_end_date
        ,product.discontinued_date
        ,product.pk_product_subcategory
        ,product.product_subcategory_name
        ,product.pk_product_category
        ,product.product_category_name
    from sales_order
    left join credit_card
        on sales_order.fk_credit_card = credit_card.pk_credit_card
    left join address
        on sales_order.fk_ship_to_address = address.pk_address
    left join product
        on sales_order.fk_product = product.pk_product

)

select *
from full_sales_order
