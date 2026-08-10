{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'sales_salesreason') }}

)

select *
from source_data
