{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'sales_salesorderdetail') }}

)

, renamed as (

    select
        cast(salesorderid as int) as fk_sales_order
        ,cast(salesorderdetailid as int) as pk_sales_order_detail
        ,cast(carriertrackingnumber as string) as carrier_tracking_number
        ,cast(orderqty as int) as order_quantity
        ,cast(productid as int) as fk_product
        ,cast(specialofferid as int) as fk_special_offer
        ,cast(unitprice as double) as unit_price
        ,cast(unitpricediscount as double) as unit_price_discount
        ,rowguid
        ,cast(modifieddate as timestamp) as modified_date
    from source_data

)

select *
from renamed
