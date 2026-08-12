{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}

)

, renamed as (

    select
        cast(salesorderid as int) as fk_sales_order
        ,cast(salesreasonid as int) as fk_sales_reason
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
