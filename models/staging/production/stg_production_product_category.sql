{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'production_productcategory') }}

)

, renamed as (

    select
        cast(productcategoryid as int) as pk_product_category
        ,cast(name as string) as name
        ,rowguid
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
