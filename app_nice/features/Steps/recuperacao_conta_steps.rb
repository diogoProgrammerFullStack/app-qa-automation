require_relative '../screens/Recuperacao_conta.rb'

# __________________ Recuperação de conta por email ______________# 

Dado('que o usuário acesse opcao Entre com celular') do
    Recuperacao::login_cell()
  end
  
  Dado('insira seu novo numero de celular') do
    Recuperacao::login_cell_novo()
  end
  
  Quando('fizer as validações usando token') do
    Recuperacao::validacao_dados()
  end
  
  Então('mostrara a tela home') do
    Recuperacao::home()
    expect(Recuperacao::home_screen.displayed?).to be true 
    $util.print
    Recuperacao::logout()
  end
  