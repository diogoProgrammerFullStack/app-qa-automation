require_relative '../screens/home.rb'

#--------------------Home Pedidos---------------------#
Dado('que o usuario esteja na home do app') do
  Clube::login() 

end

Quando('acesso Pedidos') do
  Home::pedidos() 
end

Então('exibe tela Meus Pedidos') do
  expect(Home::meus.displayed?).to be true
end
