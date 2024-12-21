with source as (
      select * from {{ source('northwind', 'itens_pedidos') }}
),
renamed as (
    select
        {{ adapter.quote("pedido_id") }},
        {{ adapter.quote("produto_id") }},
        {{ adapter.quote("quantidade") }},
        {{ adapter.quote("preco_unitario") }},
        {{ adapter.quote("subtotal") }}

    from source
)
select * from renamed
  