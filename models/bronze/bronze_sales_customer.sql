{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'sales_customer') }}

)

select *
from source_data
