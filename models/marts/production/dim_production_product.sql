{{ config(materialized = 'table') }}

with product as (
    
    select *
    from {{ ref('int_dim_production_product') }} 

)

select *
from product