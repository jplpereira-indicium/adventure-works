{{ config(materialized = 'table') }}

with person_address as (
    
    select *
    from {{ ref('stg_person_address') }} 

)

, state_province as (
    
    select *
    from {{ ref('stg_person_state_province') }} 

)

, country_region as (
    
    select *
    from {{ ref('stg_person_country_region') }}

)

, full_state_province as (

    select
        state_province.pk_state_province
        ,state_province.state_province_code
        ,state_province.is_only_state_province
        ,state_province.state_province_name
        ,country_region.pk_country_region
        ,country_region.country_region_name
    from state_province
    left join country_region
        on state_province.fk_country_region = country_region.pk_country_region
)

, full_address as (

    select
        person_address.pk_address
        ,person_address.address_line_1
        ,person_address.address_line_2
        ,person_address.city
        ,person_address.postal_code
        ,full_state_province.pk_state_province
        ,full_state_province.state_province_code
        ,full_state_province.is_only_state_province
        ,full_state_province.state_province_name
        ,full_state_province.pk_country_region
        ,full_state_province.country_region_name
    from person_address
    left join full_state_province
        on person_address.fk_state_province = full_state_province.pk_state_province
    
)

select *
from full_address

