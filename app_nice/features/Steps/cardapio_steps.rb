require_relative '../screens/Cardapio.rb'

#-----------------------Cardápio deslogado --------------------------------#

  Dado('que o usuario esteja deslogado do app') do
    $util.acesso_deslogado
  end

  Quando('clicar em cardapio') do
    Cardapio::step_cardapio()
  end

  Então('exibe a tela cardapio') do
    expect(Cardapio::step_screen.displayed?).to be true
  end

#--------------------Cardápio deslogado opção King ofertas-------------#

  Quando('clicar na opcao king ofertas') do
    Cardapio::step_cardapio()
    Cardapio::primeiras_opcoes('King ofertas')
  end

  Então('exibe o cardapio com as opcoes king ofertas') do
    expect(Cardapio::step_king_screen.displayed?).to be true
  end

#-------------------Cardápio deslogado opção carne------------------#

  Quando('clicar em carne') do
    Cardapio::step_cardapio()
    Cardapio::primeiras_opcoes('Carne')
  end

  Então('exibe o cardapio com as opcoes carne') do
    expect(Cardapio::step_carne_screen.displayed?).to be true
  end

#----------------Cardápio deslogado opção Frango e veggie--------#

  Quando('clicar em frango e veggie') do
    Cardapio::step_cardapio()
    Cardapio::primeiras_opcoes('Frango e veggie')
  end

  Então('exibe o cardapio com as opcoes frango e veggie') do
    expect(Cardapio::step_frango_screen.displayed?).to be true
  end

#----------------Cardápio deslogado opção king jr---------------#

  Quando('clicar em King Jr') do
    Cardapio::step_cardapio()
    Cardapio::scroll('hml')
    Cardapio::outras_opcoes('King jr')
  end

  Então('exibe o cardapio com as opcoes King Jr') do
    expect(Cardapio::step_kingjr_screen.displayed?).to be true
  end


#----------------Cardápio deslogado opção Sobremessas---------------#

  Quando('clicar em Sobremesas') do
    Cardapio::step_cardapio()
    Cardapio::scroll('hml')
    Cardapio::outras_opcoes('SOBREMESAS')
  end

  Então('exibe o Cardápio de Sobremesas') do
    expect(Cardapio::step_sobremessas_screen.displayed?).to be true
  end

#------------Cardápio deslogado opção Acompanhamentos ----------#

  Quando('clicar em Acompanhamento') do
    Cardapio::step_cardapio()
    Cardapio::scroll('hml')
    Cardapio::outras_opcoes('Acompanhamentos')
  end

  Então('exibe o Cardápio de Acompanhamentos') do
    expect(Cardapio::step_acompanhamentos_screen.displayed?).to be true
  end

#------------Cardápio deslogado opção Bebidas---------------#

  Quando('clicar em Bebidas') do
    Cardapio::step_cardapio()
    Cardapio::scroll('hml')
    Cardapio::outras_opcoes('Bebidas')
  end

  Então('exibe o Cardápio de Bebidas') do
    expect(Cardapio::step_bebidas_screen.displayed?).to be true
  end

  Então('serao exibidas as opcoes disponiveis') do
    expect(Cardapio::opcoes.displayed?).to be true
    Nav::screenshot()
  end
#

#  Todas as opções de cardápio em HML 

  Quando('clicar em cada uma das opcoes do cardapio') do
    Cardapio::abas()
  end

  Então('abaixo das abas serao exibidas as opcoes disponiveis') do
    expect(Cardapio::opcoes.displayed?).to be true
    Nav::screenshot()
    Nav::logout()
  end
#

#-----------  Acessar o cardapio até escolha do restaurante HML --------#
  Dado('acesse a opcao cardapio') do
    Cardapio::step_cardapio()
  end

  Quando('acesse a opcao selecionar restaurante') do
    Cardapio::selecionar_restaurante()
  end

  Quando('escolher o restaurante') do
    Cardapio::escolher_restaurante()
  end

  Então('sera exibido no banner o nome do {string}') do |restaurante|
    expect(Cardapio::validando_restaurante.text).to eql restaurante
    $util.print
  end

  Então('sera exibido no banner o nome do restaurante {string}') do |tambore|
    expect(Cardapio::validando_restaurante.text).to eql tambore
    $util.print
  end
# Cardapio deslogado prod - Opções   
  Quando('clicar em cada opcoes do cardapio') do
    Cardapio::abas_prod()
  end

#----------------- Cardápio Logado ---------------------# 

  Dado('que esteja no menu de inicio') do
    $util.login_conta_google
    Cardapio::logado_inicio_login()
  end

  Então('será exibida a tela de cardapio') do
    expect(Cardapio::logado_screen.displayed?).to be true
    Nav::screenshot()
    Nav::logout()
  end

# Hamburgueres de Carne 

  Dado('que acesso Cardápio') do
    $util.login_conta_google
    Cardapio::step_cardapio()
  end

  Quando('clicar em Hamburgueres de carne') do
    Cardapio::logado_opcoes('Carne')
  end

  Então('será exibida a tela com as opção de Hamburgueres de carne') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
    # Nav::logout()
  end

# Hamburgueres de frango 

  Quando('clicar em Hamburgueres de Frango') do
    Cardapio::logado_opcoes('Hamburgueres frango')
  end

  Então('será exibida a tela com as opções de Hamburgueres de Frango') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
    # Nav::logout()
  end

  # Opção de Saladas 
  Quando('clicar em Saladas e Vegetariano') do
    Cardapio::logado_opcoes('Saladas')
  end

  Então('será exibida a tela com as opções de Saladas e Vegetariano') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
    # Nav::logout()
  end

# Opção de King Jr
  Quando('clicar em “King Jr”') do
    Cardapio::scroll('hml')
    Cardapio::logado_opcoes('King Jr')
  end

  Então('será exibida a tela com as opções de King Jr') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
    # Nav::logout()
  end

# Opção de Acompanhamentos
  Quando('clicar em Acompanhamentos') do
    Cardapio::scroll('hml')
    Cardapio::logado_opcoes('Acompanhamentos')
  end

  Então('será exibida a tela com as opções de Acompanhamentos') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
  end

# Opção de Bebidas

  Quando('clicar em Bebidas ja logado no app') do
    Cardapio::scroll_duplo()
    Cardapio::logado_opcoes('Bebidas')
  end

  Então('será exibida a tela com as opções de Bebidas') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
  end

# Opção de Sobremesas
  Quando('clicar em Sobremesas ja logado no app') do
    Cardapio::scroll_duplo()
    Cardapio::logado_opcoes('Sobremesas')
  end

  Então('será exibida a tela com as opções de Sobremesas') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
  end

# Opção de Ofertas 
  Quando('clicar em ofertas') do
    Cardapio::scroll_duplo()
    Cardapio::logado_opcoes('Ofertas')
  end

  Então('será exibida a tela com as opções de ofertas') do
    expect(Cardapio::logado_screen_opcoes.displayed?).to be true
    Nav::screenshot()
  end

# Cardápio em Prod _ opção Todo Dia logado prod
  Quando('clicar em todo dia') do
    Cardapio::logado_opcoes('Todo dia')
    Nav::screenshot()
  end

  Então('será exibida a tela com as opções para todo dia') do
    Cardapio::logado_screen_prod()
    Nav::screenshot()
  end

# Cardápio em Prod _ opção King ofertas logado prod
  Quando('clicar em king ofertas') do
    Cardapio::logado_opcoes('King ofertas')
    Nav::screenshot()
  end

  Então('será exibida a tela com as opções para king ofertas') do
    Cardapio::logado_screen_prod()
    Nav::screenshot()
  end

# Cardápio em Prod _ opção Bovinos e Suínos logado prod
  Quando('clicar em bovinos e suinos') do
    Cardapio::logado_opcoes('Bovinos')
    Nav::screenshot()
  end

  Então('será exibida a tela com as opções para bovinos e suinos') do
    Cardapio::logado_screen_prod()
    Nav::screenshot()
  end

# Cardápio em Prod _ opção Frango + Veggie logado prod
  Quando('clicar em frango mais veggie') do
    Cardapio::scroll('prod')
    Cardapio::logado_opcoes('Frango')
    Nav::screenshot()
  end

  Então('será exibida a tela com as opções para frango e veggie') do
    Cardapio::logado_screen_prod()
    Nav::screenshot()
  end

# Cardápio em Prod _ opção King Jr logado prod
  Quando('escolher a opcao king jr') do
    Cardapio::scroll('prod')
    Cardapio::logado_opcoes('King Jr')
    Nav::screenshot()
  end

  Então('será exibida a tela com as opções para king jr') do
    Cardapio::logado_screen_prod()
    Nav::screenshot()
  end

# Cardápio em Prod _ opção Acompanhamentos logado prod
  Quando('escolher Acompanhamentos') do
    Cardapio::scroll('prod')
    Cardapio::logado_opcoes('Acompanhamentos')
    Nav::screenshot()
  end

  # Cardápio em Prod _ opção Bebidas logado prod
  Quando('escolher Bebidas') do
    Cardapio::scroll_duplo('prod')
    Cardapio::logado_opcoes('Bebidas')
    Nav::screenshot()
  end

# Cardápio em Prod _ opção Sobremesas logado prod
  Quando('escolher Sobremesas') do
    Cardapio::scroll('prod')
    Cardapio::logado_opcoes('Sobremesas')
    Nav::screenshot()
  end

# Cardápio em Prod _ consulta a todos as abas de opções

  Quando('clicar em cada uma das abas') do
    Cardapio::abas()
  end

  Então('serao exibidas na tela as opcoes do cardapio por tipo') do
    Cardapio::logado_screen_prod()
    Nav::screenshot()
  end

# Cardápio em Prod _ Logout 
  Dado('esteja dentro do cardapio') do
    $util.login_conta_google
    Cardapio::step_cardapio()
  end

  Dado('escolher retornar a home') do
    Cardapio::return_home()
  end

  Dado('clicar no menu mais') do
    Cardapio::menu_mais()
  end

  Dado('acessar as informacoes de cadastro') do
    Cardapio::inf_cadastro()
  end

  Quando('clicar em sair da conta') do
    Cardapio::logout()
  end

  Então('sera efetuado o logout') do
    expect(Cardapio::screen_logout.displayed?).to be true
  end