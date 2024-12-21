 
with source as (
      select * from {{ source('northwind', 'avaliacoes') }}
),
renamed as (
    select
        *
    from source
)
select * from renamed
  