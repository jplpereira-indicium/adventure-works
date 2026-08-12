{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'sales_salesorderheader') }}

)

select *
from source_data
