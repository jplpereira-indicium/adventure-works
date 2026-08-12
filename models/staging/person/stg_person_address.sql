{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'person_address') }}

)

, renamed as (

    select
        cast(addressid as int) as pk_address
        ,cast(addressline1 as string) as address_line_1
        ,cast(addressline2 as string) as address_line_2
        ,cast(city as string) as city
        ,cast(stateprovinceid as int) as fk_state_province
        ,cast(postalcode as string) as postal_code
        ,spatiallocation as spatial_location
        ,rowguid
        ,cast(modifieddate as date) as modified_date
    from source_data

)

select *
from renamed
