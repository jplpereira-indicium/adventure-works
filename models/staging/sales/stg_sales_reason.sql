{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'sales_salesreason') }}

)

, renamed as (

    select
        cast(salesreasonid as int) as pk_sales_reason
        ,cast(name as string) as sales_reason_name
        ,cast(reasontype as string) as reason_type
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
