require_relative '../screens/Clube_bk.rb'

#-------------------Participar do Clube-------------------# 

Dado('que o usuario esteja logado no app') do
    $util.login_conta_google
end

Quando('selecionar o Clube BK') do
    Clube::acesso_club()
end

Então('exibe a tela informando que o cadastro está em andamento') do
    Clube::aguardando_cadastro()
    $util.print
    Clube::logout()
end

#---Visualizar Controle de pontos do Clube-------------------# 

Dado('que um usuario antigo esteja logado no app') do
    $util.login_conta_google
end

Quando('clicar no menu Clube BK') do
    Clube::pontos_acesso_club_bk()
end

E('clicar em Meus pontos') do
    Clube::meus_pontos()
    $util.print
end

E('clicar em Controle de pontos') do
    Clube::controle_de_pontos()
end

Então('exibe a tela do Controle de Pontos do Clube') do
    Clube::tela_controle_de_pontos()
    $util.print
    Clube::logout()
end

#---------------Visualizar Extrato do Clube-------------------# 

Quando('clicar no Clube BK') do
    Clube::acesso_club_bk()
end

E('selecione Meus pontos') do
    Clube::meus_pontos_extrato()
    $util.print
end

E('selecionar Extrato') do
    Clube::extrato_club()
end

Então('a tela de Extrato do Clube é exibida') do
    expect(Clube::tela_saldo_de_pontos.displayed?).to be true
    $util.print
    Clube::logout()
end

#-----------------Configurações do Clube BK-------------------# 

Quando('clicar em Mais') do
    Clube::mais()
end

E('clicar em Configurações do Clube') do 
    Clube::config()
    $util.print
end

Então('exibe a tela Participação do programa') do 
    expect(Clube::tela_participacao.displayed?).to be true
    $util.print
    Clube::logout_conf_clube()
end

#--------------------Configurar Privacidade-------------------# 

Quando('selecionar o botão Mais') do
    Clube::mais_privacidade()
end

E('selecionar Configurações do Clube') do 
    Clube::config_privacidade()
end

E('clicar em Configurar Privacidade') do
    Clube::privacidade()
    $util.print
end

Então('exibe a tela de Privacidade') do 
    expect(Clube::tela_privacidade.displayed?).to be true
    $util.print
    Clube::logout_privacidade()
end

#-----------------------Ajustar Geolozalição -------------------# 

Quando('clicar no botão Mais') do
    Clube::mais_geo()
end

E('clicar em Configurações do Clube Bk') do  
    Clube::config_geo()
    $util.print
end

E('clicar em Configurar Privacidade do Bk') do
    Clube::privacidade_geo()
end

E('em seguida clicar em Ajustar Geolozalição') do
    Clube::ajustar_geo()
end

Então('o usuário deve ser direcionado para tela Informações do app') do 
    expect(Clube::tela_info_app.displayed?).to be true
    $util.print
    Clube::logout_geo()
end

#-------------------Habilitar notificações SMS-------------------# 

Quando('selecionar botão Mais do BK') do
    Clube::mais_sms()
end

E('seguir para Configurações do Clube') do  
    Clube::config_sms()
end

E('clicar em Configurar Privacidade do clube') do
    Clube::privacidade_sms()
    $util.print
end

E('clicar no botão Receber SMS') do
    Clube::habilitar_sms()
end

Então('a mensagem Preferências atualizadas deve aparecer') do 
    expect(Clube::sms_habilitado.displayed?).to be true
    $util.print
    Clube::logout()
end

#---------Habilitar notificações por aplicativo-------------------# 

Quando('clica no botão Mais') do
    Clube::mais_app()
end

E('clicar nas Configurações do Clube Bk') do  
    Clube::config_app()
end

E('escolher Configurar Privacidade do clube') do
    Clube::privacidade_app()
    $util.print
end

E('habilitar as Notificações por Aplicativo') do
    Clube::habilitar_app()
end

Então('deve ser exibida a mensagem Preferências atualizadas') do 
    expect(Clube::app_habilitado.displayed?).to be true
    $util.print
end

#---------------Habilitar notificações por email-------------------# 

Quando('clicar no botão Mais do Bk') do
    Clube::mais_email()
end

E('entrar nas Configurações do Clube Bk') do  
    Clube::config_email()
end

E('selecionar Configurar Privacidade do clube') do
    Clube::privacidade_email()
    $util.print
end

E('ativar as notificações por E-mail') do
    Clube::habilitar_email()
end

Então('deve aparecer a mensagem Preferências atualizadas') do 
    expect(Clube::email_habilitado.displayed?).to be true
    $util.print
end

#-------------------------------------Saiba Mais-------------------# 

Quando('clicar na aba Mais') do
  Clube::saibamais_mais()
end

E('entrar em Configurações do Clube') do  
  Clube::saibamais_config()
end

E('clicar em Saiba Mais') do
  Clube::botao_saibamais()
end

Então('exibe a tela Dúvidas frequentes') do 
  expect(Clube::tela_duvidas_frequentes.displayed?).to be true
  $util.print
  Clube::logout_duvidas()
end

#-------------------Regulamento do Programa------------------------#

Quando('clicar na aba Mais do app') do
  Clube::regulamento_mais()
end

E('entrar em Configurações do Clube Bk') do  
  Clube::regulamento_config()
  $util.print
end

E('clicar em Regulamento do Programa') do
  Clube::botao_regulamento()
end

Então('exibe o Regulamento do Clube BK') do 
  expect(Clube::tela_regulamento.displayed?).to be true
  $util.print
  Clube::logout_privacidade()
end

#-----Validar aba agora do Clube BK no Meus Pedidos----------------# 
  
Quando('clicar na aba de Pedidos') do
  Clube::botao_pedidos()
end
    
E('clicar em Clube BK') do
  Clube::pedidos_clube()
end
  
Então('exibe a aba agora dos Meus Pedidos - Clube BK') do 
  expect(Clube::tela_clube_bk.displayed?).to be true
  $util.print
  Clube::logout_pedidos()
end
#------------------------------------------------------------------#
  