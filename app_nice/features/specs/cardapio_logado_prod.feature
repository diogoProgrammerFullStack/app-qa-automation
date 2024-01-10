#language: pt 

@cardapio_logado_prod
Funcionalidade: Cardápio Logado prod

    # Eu como usuário do Aplicativo do BK
    # Quero poder interagir com o Cardápio
    # Para poder realizar um pedido

    @acessando_cardapio_prod @regressivo_prod
    Cenario: Acesso ao cardapio logado
        Dado que esteja no menu de inicio
        Quando clicar em cardapio
        Então será exibida a tela de cardapio

    @cardapio_opcoes @regressivo_prod
    Cenário: Ver as opcoes de cardapio
        Dado que acesso Cardápio
        Quando clicar em cada uma das abas
        Então serao exibidas na tela as opcoes do cardapio por tipo

    @cardapio_logout_prod @regressivo_prod
    Cenário: sair de cardapio e efetuar logout
        Dado esteja dentro do cardapio
        E escolher retornar a home
        E clicar no menu mais
        E acessar as informacoes de cadastro
        Quando clicar em sair da conta
        Então sera efetuado o logout