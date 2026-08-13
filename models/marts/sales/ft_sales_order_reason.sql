{{ config(materialized = 'table') }}

with sales_reason as (

    select *
    from {{ ref('int_ft_sales_order_reason') }}

)

, grouped_sales_reason as (

    select
        fk_sales_order
        ,string_agg(pk_sales_reason, ' / ') within group (order by pk_sales_reason asc) as pk_sales_reason_group
        ,string_agg(sales_reason_name, ' / ') within group (order by sales_reason_name asc) as sales_reason_name_group
        ,string_agg(distinct reason_type, ' / ') within group (order by reason_type asc) as sales_reason_type_group
    from sales_reason
    group by
        fk_sales_order
)

, full_sales_order_reason as (

    select
        grouped_sales_reason.fk_sales_order
        ,grouped_sales_reason.pk_sales_reason_group
        ,grouped_sales_reason.sales_reason_name_group
        ,grouped_sales_reason.sales_reason_type_group
        ,sales_reason.pk_sales_reason
        ,sales_reason.sales_reason_name
        ,sales_reason.reason_type
    from grouped_sales_reason
    left join sales_reason
        on grouped_sales_reason.fk_sales_order = sales_reason.fk_sales_order

)

select *
from full_sales_order_reason
