{{ config(materialized = 'table') }}

with credit_card as (

    select *
    from {{ ref('int_dim_sales_creditcard') }}

)

select *
from credit_card
