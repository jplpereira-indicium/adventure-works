{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'production_productsubcategory') }}

)

select *
from source_data
