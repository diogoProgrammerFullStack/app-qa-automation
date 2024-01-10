require_relative '../screens/Nav.rb'

# ------------- Apenas verificação da tela de Login com celular --------------- # 

Dado('que estou na tela de Login') do
    # Nav::onboarding_inicial()
    expect(Nav::optionslogin.displayed?).to be true
    expect(Nav::alternativelogin.displayed?).to be true
  end
  
  Quando('eu clicar no botão Entrar com celular') do
    Nav::login_celular()
  end

  Entao('exibe a tela Entre com seu celular') do
    Keycloack::screen_celular()
    expect(Keycloack::screen_celular.displayed?).to be true
  end

#----------------- Tela opção de login por email -----------------------#

Quando('eu clicar no botão Entrar com Email') do
    Nav::login_email()
  end
  
  Entao('exibe a Tela Entrar com seu Email') do
    Keycloack::screen_email()
      expect(Keycloack::screen_email.displayed?).to be true
  end
  