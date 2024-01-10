#language: pt 

@cardapio_logado_hml
Funcionalidade: Cardápio Logado HML

    # Eu como usuário do Aplicativo do BK
    # Quero poder interagir com o Cardápio
    # Para poder realizar um pedido

    @acessando_cardapio_hml @regressivo_hml  #OK
    Cenario: Acesso ao cardapio logado
        Dado que esteja no menu de inicio
        Quando clicar em cardapio
        Então será exibida a tela de cardapio

    @acessando_opcoes_hml @regressivo_hml #OK 
    Cenario: Acessar o Cardápio e validar as opções
        Dado que acesso Cardápio
        Quando clicar em cada uma das opcoes do cardapio
        Então abaixo das abas serao exibidas as opcoes disponiveis

    @cardapio_logout_hml @regressivo_hml #OK
    Cenário: sair de cardapio e efetuar logout
        Dado esteja dentro do cardapio
        E escolher retornar a home
        E clicar no menu mais
        E acessar as informacoes de cadastro
        Quando clicar em sair da conta
        Então sera efetuado o logout
