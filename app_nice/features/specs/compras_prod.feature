#language: pt

@compras_prod
Funcionalidade: Compra no app de produção


    @compra_pagto_PIX @regressivo_prod #validado 3.10.7 com geolocalizado
    Cenario: Comprar um lanche e pagar com PIX

        Dado que o cliente escolha seu lanche
        E escolhido restaurante
        Quando clicar em Adicionar na sacola
        E realizar o pagamento por Pix
        Então será exibido status com numero do pedido

    @compra_mercado_pago @regressivo_prod #Validado 3.10.7 com geolocalizado
    Cenario: Comprar um lanche e pagar com mercado pago

        Dado que o cliente escolha seu lanche
        E escolhido restaurante
        Quando clicar em Adicionar na sacola
        E realizar o pagamento pelo Mercado Pago
        Então será exibido status com numero do pedido

    @compra_ame @regressivo_prod
    Cenario: Comprar um lanche e pagar com Ame

        Dado que o cliente escolha seu lanche
        E escolhido restaurante
        Quando clicar em Adicionar na sacola
        E realizar o pagamento pela Ame
        Então será exibido status com numero do pedido

    @compra_Picpay @regressivo_prod
    Cenario: Comprar um lanche e pagar com PicPay

        Dado que o cliente escolha seu lanche
        E escolhido restaurante
        Quando clicar em Adicionar na sacola
        E realizar o pagamento pelo PicPay
        Então será exibido status com numero do pedido

    @compra_cartao_credito @regressivo_prod
    Cenario: Comprar um lanche e pagar com cartao de credito

        Dado que o cliente escolha seu lanche
        E escolhido restaurante
        Quando clicar em Adicionar na sacola
        E realizar o pagamento com cartao de credito
        Então será exibido status com numero do pedido

