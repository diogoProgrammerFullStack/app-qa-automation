#language: pt

@compra_hml
Funcionalidade: Compra

    @compralogado @regressivo_hml #OK 
    Cenario: Comprar um lanche e pagar com PIX
        Dado que o cliente tenha lanche na sacola
        E escolhido restaurante Labinho
        E escolher a forma de retirada
        Quando realizar o pagamento
        Então será exibido status com numero do pedido

    @compra_pagto_mercado_pago @regressivo_hml #OK
    Cenario: Comprar um lanche e pagar com mercado pago

        Dado que o cliente tenha lanche na sacola
        E escolhido restaurante Labinho
        E escolher a forma de retirada
        Quando realizar o pagamento atraves do Mercado Pago
        Então será exibido status com numero do pedido

    @compra_pagto_AME @regressivo_hml #OK
    Cenario: Comprar um lanche e pagar com AME

        Dado que o cliente tenha lanche na sacola
        E escolhido restaurante Labinho
        E escolher a forma de retirada
        Quando realizar o pagamento atraves da Ame
        Então será exibido status com numero do pedido


# **** Cenários abaixo não são mais aplicaveis para automação, 
# **** devido camada de proteção de dados de cartão de crédito inserido no sistema Android

    # @compra_pagto_cartao_credito @hml  # FALTA VALIDAR
    # Cenario: Comprar um lanche e pagar com cartao de credito

    #     Dado que o cliente tenha lanche na sacola
    #     E escolhido restaurante Labinho
    #     E escolher a forma de retirada
    #     Quando realizar o pagamento
    #     Então será exibido status com numero do pedido

    # @cadastro_cartao @prod
    # Cenario: Cadastrar cartao de credito para compras no app

    #     Dado que o usuario acesse opcao formas de pagamentos
    #     Quando clicar em adicionar novo pagamento
    #     E escolher a opcao cartao de credito
    #     E preencher os dados solicitados clicando em adicionar
    #     Então vera na tela o alert de sucesso



