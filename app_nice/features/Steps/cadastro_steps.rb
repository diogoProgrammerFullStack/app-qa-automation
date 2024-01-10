require_relative '../screens/cadastro'

# ---------------------- @cadastro_fail------------------------#

Dado('que clique na opcao entrar com celular') do
  Cadastro::step_mobile_cadastro()
end

Quando('inserir o numero de celular incompleto') do
  Cadastro::step_cell_cadastro()
end

Então('exibe a mensagem {string}') do |celular_invalido|
  expect(Cadastro.step_status_cadastro.text).to eql celular_invalido
  $util.print
end

#----------------- @cadastro_fail_token ---------------------#

Dado('que estou na tela de validacao do token') do
  Cadastro::step_mobile_cadastro()
  Cadastro::step_cell_completo()
end

Quando('preencher de forma imcompleta os campos necessarios') do
  Cadastro::step_token_fail()
end

Então('exibe a informacao {string}') do |token_invalido|
  expect(Cadastro.step_status_token.text).to eql token_invalido
end

#------------------- @cadastro_cpf_invalido HML ----------------------#

Dado('que estou na Tela insira seu cpf') do
  # Cadastro::step_inicio_cadastro()
  Cadastro::step_mobile_cadastro()
  Cadastro::step_cell_completo()
  Cadastro::step_token_sucess_cell()
end

Quando('preencher o campo com cpf invalido') do
  Cadastro::step_cpf_invalido()
end

Então('exibe o alert com a mensagem {string}') do |cpf_invalido|
  expect(Cadastro.step_status_cpf.text).to eql cpf_invalido
end

#------------------- @cadastro_cpf_invalido Prod ------------------------#

Dado('que estou no passo para inserir cpf') do
  Cadastro::step_mobile_cadastro()
  Login::cell_dados()
  Cadastro::token_valido_prod()
end

Quando('preencher o campo com um cpf invalido') do
  Cadastro::cpf_invalido_prod()
end


#------------------   @cadastro_celular_sucesso   --------------------#

Quando('preencher os campos do ddd e numero validos') do
  Cadastro::step_cell_completo()
end

Quando('preencher todas etapas com dados de cadastro') do
  Cadastro::step_token_sucess_cell()
  Cadastro::step_cpf_valido()
  Cadastro::step_melhor_email()
  Cadastro::step_nome()
  Cadastro::step_localiza()
end

Então('apresentara a tela home') do
  Cadastro::step_screen_home()
  $util.logout_home_app
end

#---------------Cadastro pelo google---------------------#

Dado('que estou na tela Entre com google') do
  # Cadastro::step_inicio_cadastro()
  Cadastro::step_google()
end

Quando('preencher o campo email do gmail') do
  Cadastro::step_insert_email_google()
end

Quando('preencher as etapas de validação de login pelo google') do
  Cadastro::step_cpf_google()
  Cadastro::step_cell_google()
  Cadastro::step_token_sucess_direto()
  Cadastro::step_localiza()
end

# -----------------  Cadastro pelo Facebook  --------------------------#

Dado('que estou na tela Entrar com facebook') do
  # Cadastro::step_inicio_cadastro()
  Cadastro::step_facebook()
  Cadastro::step_dados_facebook()
end

Quando('preencher as etapas de validação de login pelo facebook') do
  Cadastro::step_dados_facebook()
end

#-----------------------Cadastro por email-------------------------#

Dado('que estou na tela Entre com seu email') do
  # Cadastro::step_inicio_cadastro()
  Cadastro::step_email()
end

Quando('preencher o campo email') do
  Cadastro::step_entre_email()
  Cadastro::step_token_do_email()
end

Quando('preencher as etapas de validação de login por email') do
  Cadastro::step_cpf_valido()
  Cadastro::step_cell_email()
  Cadastro::step_nome()
  Cadastro::step_localiza()
end
