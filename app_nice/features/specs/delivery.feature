#language: pt

@delivery
Funcionalidade: Acessar delivery do BK

    #Como um Usuário do Aplicativo BK
    #Quero acessar o delivery do BK
    #Para solicitar entrega

    @acessar_delivery @regressivo_hml
    Cenario: acessar delivery
        Dado que o usuario esteja logado no app
        Quando clica em BK Delivery
        E exibe modal informando que esta saindo do app e entrando no site do BK Delivery
        Entao exibe a tela do delivery

