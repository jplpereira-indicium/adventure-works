{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'production_product') }}

)

select *
from source_data
