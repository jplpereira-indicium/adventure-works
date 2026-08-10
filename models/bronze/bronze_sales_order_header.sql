{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'sales_salesorderheader') }}

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
