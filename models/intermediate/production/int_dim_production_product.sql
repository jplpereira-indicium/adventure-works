{{ config(materialized = 'table') }}

with product as (
    
    select *
    from {{ ref('stg_production_product') }} 

)

, product_category as (
    
    select *
    from {{ ref('stg_production_product_category') }} 

)

, product_subcategory as (
    
    select *
    from {{ ref('stg_production_product_subcategory') }} 

)

, full_sub_category as (

    select
        product_subcategory.pk_product_subcategory
        ,product_subcategory.product_subcategory_name
        ,product_subcategory.fk_product_category
        ,product_category.pk_product_category
        ,product_category.product_category_name
    from product_subcategory
    left join product_category
        on product_subcategory.fk_product_category = product_category.pk_product_category
)

, full_product as (

    select
        product.pk_product
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
        ,product.rowguid
        ,product.modified_date
        ,full_sub_category.pk_product_subcategory
        ,full_sub_category.product_subcategory_name
        ,full_sub_category.fk_product_category
        ,full_sub_category.pk_product_category
        ,full_sub_category.product_category_name
    from product
    left join full_sub_category
        on product.fk_product_subcategory = full_sub_category.pk_product_subcategory
)

select *
from full_product