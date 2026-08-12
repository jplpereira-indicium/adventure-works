{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'person_countryregion') }}

)

, renamed as (

    select
        cast(countryregioncode as string) as pk_country_region
        ,cast(name as string) as name
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
