{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}

)

select *
from source_data
