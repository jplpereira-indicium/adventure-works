{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'sales_customer') }}

)

, renamed as (

    select
        cast(customerid as int) as pk_customer
        ,cast(personid as int) as fk_person
        ,cast(storeid as int) as fk_store
        ,cast(territoryid as int) as fk_territory
        ,rowguid
        ,cast(modifieddate as date) as modified_date
    from source_data

)

select *
from renamed
