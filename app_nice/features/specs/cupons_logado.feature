#language: pt

@xcupons
Funcionalidade: Obter cupons no App com Geolocalizado 
# A partir da versão 3.10.7 no Android foi feita a implementação do Geolocalizado

    @cupons_geolocalizado @regressivo_hml @regressivo_prod #OK
    Cenario: Acesso a cupom logado no app
        Dado que o usuário acesse o app do BK
        Quando clica em cupons
        E surgir o modal para confirmar o seu estado ou escolher outro
        Então sera direcionado para tela de cupons

    @cupons_escolher_estado @regressivo_hml @regressivo_prod #OK
    Cenário: escolher cupons de outro estado diferente da sua localizacao atual
        Dado que o usuário acesse o app do BK
        Quando clica em cupons
        E ao surgir o modal escolher a opcao Quero Alterar
        E seleciona um estado diferente da sua localização
        Então exibe tela de cupons do estado selecionado

    @cupom_maispedidas @regressivo_hml @regressivo_prod #OK
    Cenario: Acesso a cupons da categoria Mais pedidas
        Dado que o usuario acesse a opcao cupons
        Quando clicar na opcao Mais pedidas
        Entao serao apresentados os cupons
    
    @cupom_combos_upgrades @regressivo_hml @regressivo_prod #OK
    Cenario: Acesso a cupons da categoria Combos e Upgrades
        Dado que o usuario acesse a opcao cupons
        Quando clicar na opcao Combos e Upgrades
        Entao serao apresentados os cupons
    
    @cupom_pra_voce @regressivo_hml @regressivo_prod #OK
    Cenario: Acesso a cupons da categoria Pra voce
        Dado que o usuario acesse a opcao cupons
        Quando clicar na opcao Pra voce
        Entao serao apresentados os cupons

    @cupom_carne @regressivo_hml #OK
    Cenario: Acesso a cupons da categoria Bovinos e suinos
        Dado que o usuario acesse a opcao cupons
        Quando clicar na opcao carne
        Entao serao apresentados os cupons

    @cupom_Frango_Veggie @regressivo_hml @regressivo_prod #OK
    Cenario: Acesso a cupons da categoria Frango e Veggie
       Dado que o usuario acesse a opcao cupons
        Quando clicar na opcao Frango e Veggie
        Entao serao apresentados os cupons

    @cupom_sobremesas @regressivo_hml @regressivo_prod
    Cenario: Acesso a cupons da categoria Sobremesas
        Dado que o usuario acesse a opcao cupons
        Quando escolher a opcao Sobremesas
        Entao serao apresentados os cupons

    @cupom_acompanhamentos @regressivo_hml @regressivo_prod
    Cenario: Acesso a cupons da categoria Acompanhamentos
        Dado que o usuario acesse a opcao cupons
        Quando escolher a opcao Acompanhamentos
        Entao serao apresentados os cupons
        E realizara logout no App

###### Cenário tem Aba sem cupons cadastrados ###################
    # @cupom_promocao @hml
    # Cenario: Acesso a cupons da categoria Bovinos e suinos
    #     Dado que o usuario acesse a opcao cupons
    #     Quando clicar na opcao promocao
    #     Entao serao apresentados os cupons
    #     E realizara logout no App

######  Legado opção não existe mais nas Abas ##############   

    # @cupom_bovinos_suinos @prod
    # Cenario: Acesso a cupons da categoria Bovinos e suinos
    #     Dado que o usuario acesse a opcao cupons
    #     Quando clicar na opcao Bovinos e suinos
    #     Entao serao apresentados os cupons