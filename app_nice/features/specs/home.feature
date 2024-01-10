#language: pt

Funcionalidade: Acessar todas as opções que o app oferece na home

    #Como um Usuário do Aplicativo BK
    #Quero acessar todas as opções que o app oferece na home
    #Para escolher o melhor caminho de consumo

    @acessar_pedidos
    Cenario: Visualizar Meus Pedidos
        Dado que o usuario esteja na home do app
        Quando acesso Pedidos
        Então exibe tela Meus Pedidos