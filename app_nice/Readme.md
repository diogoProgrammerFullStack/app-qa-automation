# Código base para automação Mobile com Cucumber e Appium, utilizando a linguagem ruby.

# Tecnologias 

**Ruby** É uma linguagem dinâmica, open source com foco na simplicidade e na produtividade. 
**Appium** Ferramenta open-source, multi-plataforma para automação de testes de aplicações nativas, híbridas e com suporte a simuladores e execução em aparelhos reais para plataformas iOS e Android. Com ela é possível automatizar testes mobile com Ruby, Java, Node.js, PHP, C#, Clojure e Perl. Sua especificação de base é o webdriver 
**Cucumber** 


# GEMS

*Cucumber* – Essa gem é utilizada para executar testes de aceitação automatizados criados em BDD.
*Rspec* – A gem do rspec será utilizada para validação do código Ruby, por exemplo verificar se o resultado esperado está correto.


**Passo:** Execute o comando “bundle install”, esse comando é utilizado para instalar as Gem’s informadas no arquivo gemfile;

Obs: Após a execução do comando ‘bundle install’, dentro do diretório do projeto será criado um arquivo chamado ‘gemfile.lock’ esse arquivo contém todas as dependências instaladas no seu projeto.

**Passo:**  Execute o comando “cucumber --init” para criar a estrutura de testes do cucumber no projeto.

Obs: Ao executar o comando, é criado a pasta “features”. Em ‘features’ possuímos a pasta ‘support’ utilizada para criação de arquivos de configuração entre outros.

Foram criados os seguintes arquivos:

*step_definitions* – Possui todos os scripts de testes, neste arquivo iremos escrever todo o passo a passo de execução de uma especificação escrita em Gherkin.
*support/env.rb* – Este arquivo contém toda configuração da execução dos testes tais como qual navegador iremos executar nossos testes, qual URL iremos utilizar, configurações do navegador, time out e etc...


# comando para verificar se o DEVICE está ativo para automação (Android):

inserir o comando no cmder:  adb devices 

Deve apresentar a mensagem de resposta: 

******* List of devices attached *******
******* emulator-5554   device  *******



# Capabilities para Appium desktop emulador

exemplo: 

{
  "automationName": "UiAutomator2",
  "platformName": "Android",
  "deviceName": "M2101K6G", 
  "app": "app": "C:\\Burger King\\app-qa-automation-main\\app-qa-automation\\app_burger_king\\app\\app-burgerking-debug.apk"
}

Obs: dados como device name 


#_________________ metodo para coordenadas_____________________#

   
    # start_x => posição inicial na horizontal 
    # start_y => posição inicial na vertical
    # offset_x => posição final na horizontal 
    # offset_y => posição final na vertical 
    # duration => tempo em milisegundos 
    
    coord = { start_x: 0.94, start_y: 0.17, offset_x: 0.18, offset_y: 0.17, duration: 2000 }
    Appium::TouchAction.new.swipe(coord).perform


# Ativar report do Allure: 

**** digite no terminal: 
  allure serve logs\
  
# Uso do Report com Allure 


Colocar allure no After do Scenario dentro do arquivo hooks.rb: 

After do |scenario|
  
  binary_shot = driver.screenshot_as(:base64)
  temp_shot = "logs/temp_shot.png"
  
  File.open(temp_shot, "wb") do |f|
    f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
  end  

  Allure.add_attachment(
    name: "screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )

Mudar arquivo cucumber.yaml: 

**
default: -p bdd -p allure
bdd: --format pretty
allure: --format AllureCucumber::CucumberFormatter --out=logs 

# documentação do Allure disponivel em: 

https://docs.qameta.io/allure

Autorizar as politicas via  o Scoop que : 

https://scoop.sh/

abrir PowerShell como Administrador no windows e rodar os comandos: 

1. comando para autorizar o Scoop: 
#  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser  

2. comando para instalar o Scoop: 
# irm get.scoop.sh | iex 


  	
xpath:   /hierarchy/android.widget.Toast

sms = "+29299:537690 é seu código de acesso ao Burger King Brasil. Não o compartilhe"


S = sms.scan(/./)
usar somente posições 8, 9, 10, 11, 12, 13 do array 

################################## CAPS  ###########################################

app = "C:\\App Bk\\app-burgerking-debug.apk"

appPackage = "edeploy.com.br.delivery"
appActivity = ".splash.SplashActivity_"

fullReset = "true"     " serve para deletar o apk após rodar os cenários " 




[caps]
automationName = "UIAutomator2"
platformName = "Android"
deviceName = "SM_A725M"
udid = "RX8T206N9FR"
app = "C:\\App Bk\\app-burgerking-debug.apk"
fullReset = "true"


[caps]
automationName = "UIAutomator2"
platformName = "Android"
deviceName = "emulador"
udid = "emulator-5554"
app = "C:\\App Bk\\app-burgerking-debug.apk"
fullReset = "true"



[caps]
automationName = "UIAutomator2"
platformName = "Android"
deviceName = "SM_A725M"
udid = "RX8T206N9FR"
app = "C:\\App Bk\\app-burgerking-prod.apk"
fullReset = "true"













 if find_element(:id, "tvf_title") == "Seu cadastro no clube está em andamento!"
            find_element(:id, "tvf_title")
        elsif  find_element(:id, "tvf_title_first_step")
            find_element(:id, "btn_next_step").click # Continuar - Tela Parabéns do clube 
            find_element(:id, "btn_next_step").click # Entrar no CLube BK 
        else
            puts "Não conseguiu acessar o Clube Bk com novo cadastro"        


******* 
para mudar de cartão de crédito para PIX: 

 if find_element(:id, "text_security_code")
                erro_pagamento = find_element(:id, "tv_payments_options_delete_description").text
                puts "Não conseguiu pagar a compra pelo App e retornou a mensagem: '#{erro_pagamento}'"
                find_element(:id, "btn_change_payment_method").click
                find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click
                find_element(:xpath, "//*[contains(@text, 'Pix')]").click
                find_element(:id, "btn_confirm").click
                find_element(:id, "continue_buying").click
            end












********* legado 

#language: pt 

Funcionalidade: Cardápio Logado

    # Eu como usuário do Aplicativo do BK
    # Quero poder interagir com o Cardápio
    # Para poder realizar um pedido

# Contexto: Login

#     * Usuário logado no App

    @cardapio @regressivo
    Cenario: Acesso a cardapio
        Dado que esteja no menu de inicio
        Quando clicar em cardapio
        Então será exibida a tela de cardapio 

    @cardapio_hamburgueres_carne @regressivo
    Cenario: Acessar Hamburgueres de carne
        Dado que acesso Cardápio
        Quando clicar em Hamburgueres de carne
        Então será exibida a tela com as opção de Hamburgueres de carne

    @cardapio_hamburgueres_frango @regressivo
    Cenário: Acessar Hamburgueres de Frango
        Dado que acesso Cardápio
        Quando clicar em Hamburgueres de Frango
        Então será exibida a tela com as opções de Hamburgueres de Frango
    
    @cardapio_saladas @regressivo
    Cenário: Acessar Saladas e Vegetariano 
        Dado que acesso Cardápio
        Quando clicar em Saladas e Vegetariano 
        Então será exibida a tela com as opções de Saladas e Vegetariano 

    @cardapio_king @regressivo
    Cenário: Acessar King Jr
        Dado que acesso Cardápio
        Quando clicar em “King Jr”
        Então será exibida a tela com as opções de King Jr

    @cardapio_acompanhamentos @regressivo
    Cenário: Acessar Acompanhamentos
        Dado que acesso Cardápio
        Quando clicar em Acompanhamentos
        Então será exibida a tela com as opções de Acompanhamentos

    @cardapio_bebidas @regressivo
    Cenário: Acessar Bebidas
        Dado que acesso Cardápio
        Quando clicar em Bebidas ja logado no app
        Então será exibida a tela com as opções de Bebidas

    @cardapio_sobremesas @regressivo
    Cenário: Acessar Sobremesas
        Dado que acesso Cardápio
        Quando clicar em Sobremesas ja logado no app
        Então será exibida a tela com as opções de Sobremesas

    @cardapio_ofertas @regressivo
    Cenário: Acessar ofertas
        Dado que acesso Cardápio
        Quando clicar em ofertas
        Então será exibida a tela com as opções de ofertas


    


cupons_sem_geolocalizado.legado

#language: pt 
# Para versão 3.10.6 (Sem geolocalizado) 
 
Funcionalidade: Cupom Deslogado / Logado 

    # Eu como usuário do Aplicativo do BK
    # Quero poder utilizar cupons
    # Para poder realizar um pedido

    @cupons_legado
    Cenario: Acesso a cupom deslogado no app
        Dado que estou deslogado do app
        Quando clicar na opcao cupons
        Entao serao apresentados cupons por categorias

    @cupons_carne @cupons_legado #HML
    Cenario: Acesso a cupons da categoria hambugueres de carne 
        Dado que estou dentro de cupons
        Quando clicar na opcao hambugueres de carne
        Entao serao apresentados os cupons desta categoria

    @cupons_acompanhamento @cupons_legado # HML
    Cenario: Acesso a cupons da categoria Acompanhamentos
        Dado que estou dentro de cupons
        Quando clicar na opcao Acompanhamentos
        Entao serao apresentados os cupons desta categoria

    @cupons_sobremesas @cupons_legado #HML 
    Cenario: Acesso a cupons da categoria Sobremesas
        Dado que estou dentro de cupons
        Quando clicar na opcao Sobremesas
        Entao serao apresentados os cupons desta categoria

    @cupons_fome @cupons_legado #HML 
    Cenario: Acesso a cupons da categoria Pra matar a fome
        Dado que estou dentro de cupons
        Quando clicar na opcao Pra matar a fome
        Entao serao apresentados os cupons desta categoria

    @cupons_caixa @cupons_legado #HML 
    Cenario: Pegar este cupom no Caixa ou Totem
        Dado que estou deslogado do app 
        E clicar em um cupom escolhido
        E clicar em Pegar este cupom
        Quando escolher a opcao No caixa Totem
        Entao sera apresentada a mensagem de sucesso 
    
    @cupons_app @cupons_legado #HML 
    Cenario: Pegar este cupom no App
        Dado que estou deslogado do app 
        E clicar em um cupom escolhido
        E clicar em Pegar este cupom
        Quando escolher a opcao No APP
        Entao sera apresentada a opcao de escolha do restaurante


    @cupons_logado @cupons_legado #PROD _ Para versão 3.10.6 (Sem geolocalizado)  
    Cenario: Acesso a cupom deslogado no app
        Dado que estou deslogado do app
        Quando clicar na opcao cupons
        Entao serao apresentados cupons por categorias

    @cupons_maispedidas @cupons_legado #PROD
    Cenario: Acesso a cupons da categoria Mais pedidas
        Dado que estou dentro de cupons
        Quando clicar na opcao Mais pedidas
        Entao serao apresentados os cupons desta categoria
    
    @cupons_combos_upgrades @cupons_legado #PROD
    Cenario: Acesso a cupons da categoria Combos e Upgrades
        Dado que estou dentro de cupons
        Quando clicar na opcao Combos e Upgrades
        Entao serao apresentados os cupons desta categoria
    
    @cupons_pra_voce @cupons_legado #PROD
    Cenario: Acesso a cupons da categoria Pra voce
        Dado que estou dentro de cupons
        Quando clicar na opcao Pra voce
        Entao serao apresentados os cupons desta categoria

    @cupons_bovinos_suinos @cupons_legado #PROD
    Cenario: Acesso a cupons da categoria Bovinos e suinos
        Dado que estou dentro de cupons
        Quando clicar na opcao Bovinos e suinos
        Entao serao apresentados os cupons desta
        
    @cupons_Frango_Veggie @cupons_legado #PROD
    Cenario: Acesso a cupons da categoria Frango e Veggie
        Dado que estou dentro de cupons
        Quando clicar na opcao Frango e Veggie
        Entao serao apresentados os cupons desta

    @cupons_sobremesas @cupons_legado #PROD
    Cenario: Acesso a cupons da categoria Sobremesas
        Dado que estou dentro de cupons
        Quando clicar na opcao Sobremesas
        Entao serao apresentados os cupons desta categoria

    @cupons_acompanhamento @cupons_legado #PROD
    Cenario: Acesso a cupons da categoria Acompanhamentos
        Dado que estou dentro de cupons
        Quando clicar na opcao Acompanhamentos
        Entao serao apresentados os cupons desta categoria


Recuperação_contas.legado

############  Forma de recuperação retirada do App  ####################
    # @recuperacao_usando_senha
    # Cenario: Usuário legado recuperando conta usando senha 
    #     Dado que o usuário acesse opcao Entre com email
    #     E insira seu novo endereco de email
    #     Quando fizer as validações usando token
    #     Então mostrara a tela home


Cadastro

####### Ajustar para cadastrar conta google pelo app #############

    # @cadastro_google_sucesso @regressivo_hml
    # Cenario: Cadastro por conta google
    #     Dado que estou na tela Entre com google
    #     Quando preencher o campo email do gmail
    #     E preencher as etapas de validação de login pelo google
    #     Então apresentara a tela home


##### Não aplicavél para automação, pois só conseguimos rodar uma vez por device devido criar vinculo 
    # @cadastro_facebook_sucesso @cadastro_hml
    #  Cenario: Cadastro por facebook
    #     Dado que estou na tela Entrar com facebook
    #     Quando preencher as etapas de validação de login pelo facebook
    #     Entao sera apresentada a tela home


Clube BK

##############    Cenários ainda não implementados!!   ############## 

    # @historico_clube
    # Cenario:Validar aba histórico do Clube BK no Meus Pedidos
    #     Dado que um usuario esteja logado no App do BK
    #     Quando clicar em Pedidos no tab bar
    #     E entrar em Clube BK
    #     E clicar em Histórico
    #     Então exibe a aba histórico dos Meus Pedidos - Clube BK

    # @extrato_pos_compra 
    # Cenario: Extrato de pontos do clube após realizar uma compra
    #     Quando realiza uma compra
    #     E selecionar o Cluber BK
    #     E clicar em meus pontos
    #     E clicar em extrato
    #     Então exibe os pontos da ultima compra realizada

    # @resgatar_recompensa
    # Cenario:Resgatar uma recompensa
    #     Quando clicar em todas as recompensas
    #     E clicar em uma recompensa
    #     E clicar em resgatar essa recompensa
    #     E selecionar Confirmar resgate
    #     Então exibe o código da recompensa resgatada