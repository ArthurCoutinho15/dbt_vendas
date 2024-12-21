with source as (
      select * from {{ source('northwind', 'carrinho') }}
),
renamed as (
    select
        {{ adapter.quote("cliente_id") }},
        {{ adapter.quote("produto_id") }},
        {{ adapter.quote("quantidade") }},
        {{ adapter.quote("data_adicionado") }}

    from source
)
select * from renamed
  