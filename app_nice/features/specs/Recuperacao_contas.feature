#language: pt

@recuperacao_conta
Funcionalidade: Recuperação de Conta
    # Como um Usuário do Aplicativo BK
    # Quero poder recuperar minha conta
    # Para poder efetuar compras pelo Aplicativo novamente


    @recuperacao_novo_celular @regressivo_hml
    Cenario: Recuperar conta por email usando novo numero de celular
        Dado que o usuário acesse opcao Entre com celular
        E insira seu novo numero de celular
        Quando fizer as validações usando token
        Então mostrara a tela home

###########  Falta completar implementação  ###############
    # @recuperacao_novo_email
    # Cenario: Recuperar conta usando novo email
    #     Dado que o usuário acesse opcao Entre com email
    #     E insira seu novo endereco de email
    #     Quando fizer as validações usando token
    #     Então mostrara a tela home

    # @recuperacao_usando_senha
    # Cenario: Usuário legado recuperando conta usando senha 
    #     Dado que o usuário acesse opcao Entre com email
    #     E insira seu novo endereco de email
    #     Quando fizer as validações usando token
    #     Então mostrara a tela home
