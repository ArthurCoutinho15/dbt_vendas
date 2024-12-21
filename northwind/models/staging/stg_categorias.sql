with source as (
      select * from {{ source('northwind', 'categorias') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("nome") }}

    from source
)
select * from renamed
  