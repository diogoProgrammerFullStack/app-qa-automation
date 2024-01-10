#language: pt

@onboarding_login
Funcionalidade: Opções de login

# Como um Usuário do Aplicativo BK
# Quero saber quais a opções de Login
# Para poder me logar no Sistema pelo Android

    @telas_de_login @regressivo_hml @prod 
    Cenario: Validar opção de Login pelo Celular

        Dado que estou na tela de Login
        Quando eu clicar no botão Entrar com celular
        Entao exibe a tela Entre com seu celular

    @telas_de_login_email @regressivo_hml
    Cenario: Validar Login pelo Email

        Dado que estou na tela de Login
        Quando eu clicar no botão Entrar com Email
        Entao exibe a Tela Entrar com seu Email
