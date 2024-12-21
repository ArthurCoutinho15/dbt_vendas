with source as (
      select * from {{ source('northwind', 'clientes') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("nome") }},
        {{ adapter.quote("email") }},
        {{ adapter.quote("telefone") }},
        {{ adapter.quote("data_registro") }}

    from source
)
select * from renamed
  