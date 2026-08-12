{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'person_stateprovince') }}

)

, renamed as (

    select
        cast(stateprovinceid as int) as pk_state_province
        ,cast(stateprovincecode as string) as state_province_code
        ,cast(countryregioncode as string) as fk_country_region
        ,isonlystateprovinceflag as is_only_state_province
        ,cast(name as string) as name
        ,cast(territoryid as int) as fk_territory
        ,rowguid
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
