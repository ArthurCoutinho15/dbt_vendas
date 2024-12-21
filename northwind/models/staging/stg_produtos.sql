with source as (
      select * from {{ source('northwind', 'produtos') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("nome") }},
        {{ adapter.quote("descricao") }},
        {{ adapter.quote("categoria_id") }},
        {{ adapter.quote("preco") }},
        {{ adapter.quote("marca") }},
        {{ adapter.quote("estoque") }},
        {{ adapter.quote("data_cadastro") }}

    from source
)
select * from renamed
  