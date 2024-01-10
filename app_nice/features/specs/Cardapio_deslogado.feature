#language: pt 

@cardapio_deslogado
Funcionalidade: Cardápio Deslogado

    # Eu como usuário do Aplicativo do BK
    # Quero poder interagir com o Cardápio
    # Para poder realizar um pedido

    @acessando_cardapio @regressivo_hml @regressivo_prod #OK
    Cenario: Acessar cardapio deslogado
        Dado que o usuario esteja deslogado do app
        Quando clicar em cardapio
        Então exibe a tela cardapio

    @acessando_opcoes @regressivo_hml #OK 
    Cenario: Acessar o Cardápio e validar as opções
        Dado que o usuario esteja deslogado do app
        E clicar em cardapio
        Quando clicar em cada uma das opcoes do cardapio
        Então serao exibidas as opcoes disponiveis

    @acessando_opcoes_prod @regressivo_prod #OK 
    Cenario: Acessar o Cardápio e validar as opções
        Dado que o usuario esteja deslogado do app
        E clicar em cardapio
        Quando clicar em cada opcoes do cardapio
        Então serao exibidas as opcoes disponiveis
  
    @escolhendo_restaurante @regressivo_hml #OK
    Cenario: Acessar o cardapio até escolha do restaurante
        Dado que o usuario esteja deslogado do app
        E acesse a opcao cardapio
        Quando acesse a opcao selecionar restaurante
        E escolher o restaurante
        Então sera exibido no banner o nome do "Labinho E-deploy"

    @escolhendo_restaurante_prod @regressivo_prod #OK
    Cenario: Acessar o cardapio até escolha do restaurante
        Dado que o usuario esteja deslogado do app
        E acesse a opcao cardapio
        Quando acesse a opcao selecionar restaurante
        E escolher o restaurante
        Então sera exibido no banner o nome do restaurante "Shop. Tamboré"
