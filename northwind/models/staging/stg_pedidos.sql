with source as (
      select * from {{ source('northwind', 'pedidos') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("cliente_id") }},
        {{ adapter.quote("endereco_id") }},
        {{ adapter.quote("data_pedido") }},
        {{ adapter.quote("status") }}

    from source
)
select * from renamed
  