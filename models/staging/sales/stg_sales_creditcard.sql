{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'sales_creditcard') }}

)

, renamed as (

    select
        cast(creditcardid as int) as pk_credit_card
        ,cast(cardtype as string) as card_type
        ,cast(cardnumber as string) as card_number
        ,cast(expmonth as int) as expiration_month
        ,cast(expyear as int) as expiration_year
        ,cast(modifieddate as date) as modified_date
    from source_data

)

select *
from renamed
