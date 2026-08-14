{{ config(materialized = 'table') }}

with

    date as (

        select *
        from {{ ref('int_dim_utils_date') }}

    )

    select *
    from date
    