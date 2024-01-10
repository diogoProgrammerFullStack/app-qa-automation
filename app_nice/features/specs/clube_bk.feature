#language: pt

@zclube_bk
Funcionalidade: Clube BK 
    # Eu como usuário do Aplicativo do BK
    # Quero poder utilizar o Clube BK
    # Para poder acumular pontos e resgatar recompensas

    @acesso_ao_clube @regressivo_hml #OK 
    Cenario: Participar do Clube
        Dado que o usuario esteja logado no app
        Quando selecionar o Clube BK
        Então exibe a tela informando que o cadastro está em andamento
    
    @pontos_clube @regressivo_hml #OK 
    Cenario: Visualizar Controle de pontos do Clube
        Dado que um usuario antigo esteja logado no app
        Quando clicar no menu Clube BK
        E clicar em Meus pontos
        E clicar em Controle de pontos
        Então exibe a tela do Controle de Pontos do Clube
         
    @extrato_clube @regressivo_hml #OK
    Cenario: Visualizar Extrato do Clube
        Dado que um usuario antigo esteja logado no app
        Quando clicar no Clube BK
        E selecione Meus pontos
        E selecionar Extrato
        Então a tela de Extrato do Clube é exibida

    @config_clube @regressivo_hml #OK
    Cenário: Acessar as Configurações do Clube
        Dado que um usuario antigo esteja logado no app
        Quando clicar em Mais
        E clicar em Configurações do Clube
        Então exibe a tela Participação do programa

    @config_privacidade @regressivo_hml #OK
    Cenário: Configurar Privacidade
        Dado que um usuario antigo esteja logado no app
        Quando selecionar o botão Mais
        E selecionar Configurações do Clube
        E clicar em Configurar Privacidade
        Então exibe a tela de Privacidade 

    @config_geolozalizado @regressivo_hml #OK
    Cenário: Ajustar Geolocalização 
        Dado que um usuario antigo esteja logado no app
        Quando clicar no botão Mais
        E clicar em Configurações do Clube Bk
        E clicar em Configurar Privacidade do Bk
        E em seguida clicar em Ajustar Geolozalição
        Então o usuário deve ser direcionado para tela Informações do app

    @saiba_mais @regressivo_hml #OK 
    Cenário: Saiba mais 
        Dado que um usuario antigo esteja logado no app
        Quando clicar na aba Mais
        E entrar em Configurações do Clube
        E clicar em Saiba Mais
        Então exibe a tela Dúvidas frequentes

    @regulamento_programa @regressivo_hml #OK
    Cenário:Regulamento do Programa 
        Dado que um usuario antigo esteja logado no app
        Quando clicar na aba Mais do app
        E entrar em Configurações do Clube Bk
        E clicar em Regulamento do Programa
        Então exibe o Regulamento do Clube BK

    @meus_pedidos_clube @regressivo_hml
    Cenario: Validar aba agora do Clube BK no Meus Pedidos
        Dado que um usuario antigo esteja logado no app
        Quando clicar na aba de Pedidos
        E clicar em Clube BK
        Então exibe a aba agora dos Meus Pedidos - Clube BK

##########  Retirado do App de HML até correção do BUG https://burgerking.atlassian.net/browse/AB-2991   #########

    # @config_notificações_sms      
    # Cenário: Habilitar notificações por sms
    #     Dado que um usuario antigo esteja logado no app
    #     Quando selecionar botão Mais do BK
    #     E seguir para Configurações do Clube
    #     E clicar em Configurar Privacidade do clube
    #     E clicar no botão Receber SMS
    #     Então a mensagem Preferências atualizadas deve aparecer

    # @config_notificações_app
    # Cenário: Habilitar notificações por aplicativo
    #     Dado que um usuario antigo esteja logado no app
    #     Quando clica no botão Mais
    #     E clicar nas Configurações do Clube Bk
    #     E escolher Configurar Privacidade do clube
    #     E habilitar as Notificações por Aplicativo
    #     Então deve ser exibida a mensagem Preferências atualizadas 

    # @config_notificações_email
    # Cenário: Habilitar notificações por aplicativo
    #     Dado que um usuario antigo esteja logado no app
    #     Quando clicar no botão Mais do Bk
    #     E entrar nas Configurações do Clube Bk
    #     E selecionar Configurar Privacidade do clube
    #     E ativar as notificações por E-mail
    #     Então deve aparecer a mensagem Preferências atualizadas 




  
     

