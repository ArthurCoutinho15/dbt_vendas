with source as (
      select * from {{ source('northwind', 'pagamentos') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("pedido_id") }},
        {{ adapter.quote("valor") }},
        {{ adapter.quote("metodo") }},
        {{ adapter.quote("status") }},
        {{ adapter.quote("data_pagamento") }}

    from source
)
select * from renamed
  