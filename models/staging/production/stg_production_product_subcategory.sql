{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'production_productsubcategory') }}

)

, renamed as (

    select
        cast(productsubcategoryid as int) as pk_product_subcategory
        ,cast(productcategoryid as int) as fk_product_category
        ,cast(name as string) as product_subcategory_name
        ,rowguid
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
