

# Acesso a cupons 
Dado('que estou deslogado do app') do
    $util.acesso_deslogado
end
  
Quando('clicar na opcao cupons') do
    Cupons::clicar_cupons()
end
  
Entao('serao apresentados cupons por categorias') do
    expect(Cupons::tela_cupons.displayed?).to be true
    expect(Cupons::tela_cupons.text).to eql "Cupons"
    Nav::screenshot()
end

# Opções de cupons (carne) 
Dado('que estou dentro de cupons') do
    $util.acesso_deslogado
    Cupons::clicar_cupons()
end
  
Quando('clicar na opcao hambugueres de carne') do
    Cupons::opcao("carne")
end
  
Entao('serao apresentados os cupons desta categoria') do
    expect(Cupons::tickets.displayed?).to be true
    Nav::screenshot()
end

# Opção cupons (acompanhamentos)
Quando('clicar na opcao Acompanhamentos') do
    Cupons::opcao("acompanhamentos")
end
  
# Opção cupons (Sobremesas)
Quando('clicar na opcao Sobremesas') do
    Cupons::opcao("sobremesas")
end
  
# Opção cupons (Matar a fome)
Quando('clicar na opcao Pra matar a fome') do
    Cupons::scroll()
    Cupons::opcao("pra matar a fome")
end


Dado('clicar em um cupom escolhido') do
    Cupons::clicar_cupons()
    Cupons::escolhido()
end
  
Dado('clicar em Pegar este cupom') do
    Cupons::pegar_cupom()
end
  
Quando('escolher a opcao No caixa Totem') do
    Cupons::caixa_totem()
end
  
Entao('sera apresentada a mensagem de sucesso') do
    expect(Cupons.resgate_sucesso.text).to eql "Este cupom agora é seu!"
    Nav::screenshot()
end
  
Quando('escolher a opcao No APP') do
    Cupons::no_app()
end
  
Entao('sera apresentada a opcao de escolha do restaurante') do
    expect(Cupons::restaurante.displayed?).to be true
    Nav::screenshot()
end
  