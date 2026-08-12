{{ config(materialized = 'table') }}

with source_data as (

    select
        *
    from {{ source('adventure_works', 'sales_salesorderheader') }}

)

, renamed as (
    
    select
        cast(salesorderid as int) as pk_sales
        ,cast(revisionnumber as int) as revision_number
        ,cast(orderdate as date) as order_date
        ,cast(duedate as date) as due_date 
        ,cast(shipdate as date) as ship_date
        ,cast(status as int) as status_number
        ,onlineorderflag as is_online_order
        ,cast(purchaseordernumber as string) as purchase_order_number
        ,cast(accountnumber as string) as account_number
        ,cast(customerid as int) as fk_customer
        ,cast(salespersonid as int) as fk_sales_person
        ,cast(territoryid as int) as fk_territory
        ,cast(billtoaddressid as int) as fk_bill_to_address
        ,cast(shiptoaddressid as int) as fk_ship_to_address
        ,cast(shipmethodid as int) as fk_ship_method
        ,cast(creditcardid as int) as fk_credit_card
        ,cast(creditcardapprovalcode as string) as credit_card_approval_code
        ,cast(currencyrateid as int) as fk_currency_rate
        ,cast(subtotal as decimal(15, 2)) as subtotal
        ,cast(taxamt as decimal(15, 2)) as tax_amount
        ,cast(freight as decimal(15, 2)) as freight
        ,cast(totaldue as decimal(15, 2)) as total_due
        ,cast(comment as string) as comment
        ,rowguid
        ,cast(modifieddate as date) as modified_date
    from source_data

)

select *
from renamed