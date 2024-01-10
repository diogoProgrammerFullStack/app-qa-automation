#language: pt

@cadastro
Funcionalidade: Cadastro de Usuários

# Eu como usuário do Aplicativo do BK
# Quero poder efetuar o cadastro no Sistema
# Para poder efetuar minhas compras pelo aplicativo

    @cadastro_fail @regressivo_hml @regressivo_prod #OK
    Cenario: Tentativa de cadastro com dados celular faltante
        Dado que clique na opcao entrar com celular
        Quando inserir o numero de celular incompleto
        Então exibe a mensagem "O celular preenchido não é válido!"

    @cadastro_fail_token @regressivo_hml @regressivo_prod
    Cenario: Tentativa de cadastro com dados do token faltante
        Dado que estou na tela de validacao do token
        Quando preencher de forma imcompleta os campos necessarios
        E clicar no botão Continuar
        Então exibe a informacao "O código preenchido não é válido!"

    @cpf_invalido @regressivo_hml
    Cenario: Validar Cadastro com cpf invalido
        Dado que estou na Tela insira seu cpf 
        Quando preencher o campo com cpf invalido
        Então exibe o alert com a mensagem "O CPF preenchido não é válido!"

    @cpf_invalido_prod @regressivo_prod
    Cenario: Validar Cadastro com cpf invalido
        Dado que estou no passo para inserir cpf
        Quando preencher o campo com um cpf invalido
        Então exibe o alert com a mensagem "O CPF preenchido não é válido!"

    @cadastro_celular_sucesso @regressivo_hml
    Cenario: Cadastro por Celular
        Dado que estou na tela Entre com seu celular
        Quando preencher os campos do ddd e numero validos
        E preencher todas etapas com dados de cadastro
        Então apresentara a tela home

    @cadastro_email_sucesso @regressivo_hml
    Cenario: Cadastro por Email
        Dado que estou na tela Entre com seu email
        Quando preencher o campo email
        E preencher as etapas de validação de login por email
        Então apresentara a tela home
