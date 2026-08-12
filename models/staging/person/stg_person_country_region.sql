{{ config(materialized = 'table') }}

with source_data as (

    select
        * 
    from {{ source('adventure_works', 'person_countryregion') }}

)

select *
from source_data
