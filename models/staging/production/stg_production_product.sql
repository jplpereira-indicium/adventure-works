{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'production_product') }}

)

, renamed as (

    select
        cast(productid as int) as pk_product
        ,cast(name as string) as product_name
        ,cast(productnumber as string) as product_number
        ,makeflag as is_make
        ,finishedgoodsflag as is_finished_goods
        ,cast(color as string) as color
        ,cast(safetystocklevel as int) as safety_stock_level
        ,cast(reorderpoint as int) as reorder_point
        ,cast(standardcost as double) as standard_cost
        ,cast(listprice as double) as list_price
        ,cast(size as string) as size
        ,cast(sizeunitmeasurecode as string) as size_unit_measure_code
        ,cast(weightunitmeasurecode as string) as weight_unit_measure_code
        ,cast(weight as double) as weight
        ,cast(daystomanufacture as int) as days_to_manufacture
        ,cast(productline as string) as product_line
        ,cast(class as string) as class
        ,cast(style as string) as style
        ,cast(productsubcategoryid as int) as fk_product_subcategory
        ,cast(productmodelid as int) as fk_product_model
        ,cast(sellstartdate as timestamp) as sell_start_date
        ,cast(sellenddate as timestamp) as sell_end_date
        ,cast(discontinueddate as timestamp) as discontinued_date
        ,rowguid
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
