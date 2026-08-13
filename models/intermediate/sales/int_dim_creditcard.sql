{{ config(materialized = 'table') }}

with credit_card as (

    select *
    from {{ ref('stg_sales_creditcard') }}

)

select
    credit_card.pk_credit_card
    ,credit_card.card_type
    ,credit_card.card_number
    ,credit_card.expiration_month
    ,credit_card.expiration_year
from credit_card
