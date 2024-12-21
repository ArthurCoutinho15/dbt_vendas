{{
    config(
        tags=['vendas']
    )
}}

with pedidos as (
    select *
    from {{ref("stg_pedidos")}}
),

clientes as (
    select *
    from {{ref("stg_clientes")}}
),

itens_pedidos as (
    select *
    from {{ref("itens_pedidos")}}
),

produtos as (
    select *
    from {{ref("stg_produtos")}}
),

pagamentos as (
    select *
    from {{ref("stg_pagamentos")}}
),

categorias as (
    select *
    from {{ref("stg_categorias")}}
),

joined as (
    select pedidos.data_pedido, clientes.nome as nome_cliente, clientes.email, pagamentos.valor, pagamentos.metodo, pedidos.status as status_envio, pagamentos.data_pagamento,
    itens_pedidos.quantidade, itens_pedidos.preco_unitario, produtos.nome as nome_produto, categorias.nome as categoria_produto
    from pedidos as pedidos
    left join clientes as clientes on pedidos.cliente_id = clientes.id
    left join pagamentos as pagamentos on pedidos.id = pagamentos.pedido_id
    left join itens_pedidos as itens_pedidos on itens_pedidos.pedido_id = pedidos.id
    left join produtos as produtos on produtos.id = itens_pedidos.produto_id
    left join categorias as categorias on categorias.id = produtos.categoria_id
)

select *
from joined