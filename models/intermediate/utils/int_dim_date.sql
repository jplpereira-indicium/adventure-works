{{ config(materialized = 'table') }}

with
    
    date_spine as (
        {{
            dbt_utils.date_spine(
                datepart = "day",
                start_date = "cast('2000-01-01' as date)",
                end_date = "cast('2050-01-01' as date)"
            )
        }}
    )

    , create_dates as (
        
        select
            row_number() over(order by date_day asc) as pk_date
            ,cast(date_day as date) as dt_date
            ,extract(day from date_day) as nr_day
            ,extract(month from date_day) as nr_month
            ,extract(year from date_day) as nr_year
            ,extract(quarter from date_day) as nr_quarter
            ,extract(dow from date_day) as nr_day_of_week
            ,case
                when extract(dow from date_day) in (1, 7) then false
                else true
            end as is_week_day
        from date_spine
    )

select *
from create_dates

