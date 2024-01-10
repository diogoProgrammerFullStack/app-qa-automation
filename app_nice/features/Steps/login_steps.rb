require_relative '../screens/login.rb'

# ------------ Entrada na opção de login com celular inserindo dados @logincelular---------------- # 

Dado('que estou na tela Entre com seu celular') do
  # Nav::onboarding_inicial()
  Nav::login_celular()
  Keycloack::webview()
  Keycloack::screen_celular()
end

Quando('preencher os campos ddd {string} e numero {string} validos') do |ddd, celular|
  Keycloack::sign_in(ddd, celular)
  Nav::screenshot()
end

Quando('clicar no botão Continuar') do
  Keycloack::button_continuar()
end

Quando('preencher todas etapas com dados de validação') do
  Keycloack::token_validacao()
  Keycloack::button_continuar()
  Keycloack::validacao_cpf()
  Keycloack::permissoes()
end

Então('sera apresentada a tela home') do
  expect(Home::screen.displayed?).to be true
  $util.logout_home_app
end

#_____ Tentativa de login com celular usando dados inválidos (@login_happiless_phone)______#
  
Quando('preenher os campos {string} e {string}') do |ddd, celular|  
  Nav::login_celular()  
  Keycloack::sign_in(ddd, celular)
end
    
Então('devo ver {string} como popup') do |mensagem|
  expect(Keycloack::cel_invalido.text).to eql mensagem
  Nav::screenshot()
end

# _________________ Login por celular (PROD) ____________________# 

Quando('preencher o email valido {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

#-------------------Login com dados inválidos para o token ------------------------# 

Dado('que estou na tela de inserir token para Login') do
  Token::init()
end

Quando('preencher o campo do token com dados invalidos') do
  Token::insert()
end
  
Quando('clicar em continuar') do
  Keycloack::button_continuar()
end
  
Então('devo a mensagem de popup é apresentada {string}') do |mensagem|
  expect(Token::code.text).to eql mensagem
  Nav::screenshot()
end


#__________ @login_token_dados_faltantes _____________________# 

Quando('deixar de preencher um dos campos do token') do
  Token::insert_token_faltante()
end

Então('devo continuar na mesma tela') do
  expect(Token::screen_token.displayed?).to be true
  Nav::screenshot()
end

#_____________________ TOKEN EXPIRADO _____________________________#

Quando('preencher os campos DDD e Celular com dados validos') do
  Login_Step::mobile()
  Login_Step::cell()
end

Quando('demorar preencher os campos do token por mais de cento e vinte segundos') do
  Login_Step::token_expirado()
  Nav::screenshot()
end

Entao('exibe o botao Enviar novo SMS de validação') do
  Nav::screenshot()
end


# _________________ Login por email fail ____________________# 

Quando('preenher os campos {string}') do |email|
  Login_Step::email()
  Login_Step::email_insert(email)
end

Então('devo ver {string} de dados inválidos') do |pop_up|
  expect(Login_Step::screen.text).to eql pop_up
  Nav::screenshot()
end

# _________________ Login por celular (PROD) ____________________# 

Dado('que acesse a tela Entre com seu celular') do
  Login::cell_prod()
end

Quando('preencher os campos ddd e numero validos') do
  Login::cell_dados()
end

Quando('preencher as etapas com dados de validação') do
  Login::dados_validos()
end

