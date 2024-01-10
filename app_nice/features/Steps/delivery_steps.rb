require_relative '../screens/delivery.rb'

# ----------------Delivery --------------------------------#
  
Quando('clica em BK Delivery') do
  Delivery::acesso()
end

E('exibe modal informando que esta saindo do app e entrando no site do BK Delivery') do
  expect(Delivery::modal.displayed?).to be true
end

Entao('exibe a tela do delivery') do
  Delivery::endereco()
  Nav::screenshot()
end
