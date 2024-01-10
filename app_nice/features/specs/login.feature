#language: pt

@login_hml
Funcionalidade: Validar Login
    # Como um Usuário do Aplicativo BK
    # Quero efetuar o Login pelo Celular
    # Para poder efetuar compras pelo Aplicativo
       
    @logincelular @loginsucesso @regressivo_hml  #OK
    Cenario: login com celular dados validos

        Dado que estou na tela Entre com seu celular
        Quando preencher os campos ddd "11" e numero "960980637" validos
        E clicar no botão Continuar
        E preencher todas etapas com dados de validação
        Então sera apresentada a tela home
    
    @login_happiless_phone @regressivo_hml @prod #OK 
    Esquema do Cenario: Tentar logar dados invalidos

        Dado que estou na tela de Login
        Quando preenher os campos <ddd> e <celular>
        E clicar no botão Continuar
        Então devo ver <mensagem> como popup

        Exemplos: 
        | ddd  |   celular   |                 mensagem               |
        | "02" | "09203020"  |  "O celular preenchido não é válido!"  |
        | "11" | "000000000" |  "O celular preenchido não é válido!"  |
        | "20" | "123456789" |  "O celular preenchido não é válido!"  |
        |  ""  | "909171122" |  "O celular preenchido não é válido!"  |
        | "99" | "57643336"  |  "O celular preenchido não é válido!"  |
        | "11" |      ""     |  "O celular preenchido não é válido!"  |

    @login_token_invalido @regressivo_hml @prod #OK 
    Cenario: Token invalido

        Dado que estou na tela de inserir token para Login
        Quando preencher o campo do token com dados invalidos
        E clicar em continuar
        Então devo a mensagem de popup é apresentada "O código preenchido não é válido!"

    @login_token_dados_faltantes @regressivo_hml @prod #OK
    Cenario: Token dados faltantes
        
        Dado que estou na tela de inserir token para Login
        Quando deixar de preencher um dos campos do token
        E clicar em continuar
        Então devo continuar na mesma tela

    @login_happiless_email @regressivo_hml @prod #OK
    Esquema do Cenario: Tentar logar dados invalidos

        Dado que estou na tela de Login
        Quando preenher os campos <email>
        E clicar no botão Continuar
        Então devo ver <mensagem> de dados inválidos

        Exemplos: 
        |     email      |      mensagem       |
        |       ""       |  "E-mail inválido"  |
        |   "teste#$%"   |  "E-mail inválido"  |
        |"burgerking.com"|  "E-mail inválido"  | 

    # @logincell_prod @prod
    # Cenario: login com celular dados validos em prod

    #     Dado que acesse a tela Entre com seu celular
    #     Quando preencher os campos ddd e numero validos
    #     E preencher as etapas com dados de validação
    #     Então sera apresentada a tela home


#############  Avaliar método para validação ou opção para teste manual  ##################
    # @login_token_expirado # FALTA VALIDAÇÃO 
    # Cenario: Codigo de Validação expirado
    #     Dado que estou na tela de Login
    #     Quando preencher os campos DDD e Celular com dados validos
    #     E demorar preencher os campos do token por mais de cento e vinte segundos
    #     Entao exibe o botao Enviar novo SMS de validação

############ Falta parte da implementação  #####################
    # @loginemail            # FALTA IMPLEMENTAÇÃO 
    # Cenario: login com email valido

    #     Dado que estou na tela Entre com seu email
    #     Quando preencher o email valido "email@qateste.com"
    #     E preencher as etapas de validação de login por email
    #     Então sera apresentada a tela home