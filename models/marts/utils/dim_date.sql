{{ config(materialized = 'table') }}

with

    date as (

        select *
        from {{ ref('int_dim_date') }}

    )

    select *
    from date
    