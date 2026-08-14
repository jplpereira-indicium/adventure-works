{{ config(materialized = 'table') }}

with person_address as (
    
    select *
    from {{ ref('int_dim_person_address') }} 

)

select *
from person_address

