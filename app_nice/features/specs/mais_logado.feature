#language: pt

Funcionalidade: Aba Mais logado
    #Quero poder selecionar a Aba “mais”
    #Para visualizar mais opções

    @acessar_mais
    Cenario: Acessar o menu mais
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        Então será exibido a tela Minha conta

    @acessar_cadastro
    Cenario: Acesso as informações de cadastro
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        E toca em meu nome
        Então será exibida a tela informações de cadastro

    @acessar_endereços
    Cenario: Acesso Meus endereços
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        E toca em Meus endereços
        Então será exibida a tela Meu Endereços

    @acessar_pagamentos
    Cenario: Acesso Formas de pagamentos
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        E toca em Formas de pagamento
        Então será exibida a tela Forma de pagamento

    @acessar_preferencias
    Cenario: Acesso a Preferências
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        E toca em Preferencias
        Então será exibida a tela de Privacidade

    @acessar_direitos
    Cenario: Acesso a Direitos
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        E toca em Direitos
        Então será exibida a tela de Direitos

    @acessar_duvidas
    Cenario: Acesso a Duvidas
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        E toca em Duvidas
        Então será exibida a tela de Duvidas

    @acessar_fale
    Cenario: Acesso a Fale
        Dado que o usuario esteja logado no app
        Quando clicar em menu Mais
        E toca em Fale
        Então será exibida a tela de Fale