require_relative '../screens/Compra.rb'


#_____  Compra de lanche em restaurante especifico (LOGADO) em HML _____# 

Dado('que o cliente tenha lanche na sacola') do
    $util.login_conta_google
    Buy::cardapio()
    Snack::escolher_lanche_king()
end

Dado('escolhido restaurante Labinho') do
    Snack::escolher_restaurante()
end

Dado('escolher a forma de retirada') do
    Buy::forma_retirada()
end

Quando('realizar o pagamento') do
    Buy::forma_pagamento()
end

Então('será exibido status com numero do pedido') do
    expect(Buy::status.displayed?).to be true
    $util.print
    Buy::logout_compras()
end

# _________ COMPRA LOGADO HML - PAGTO MERCADO PAGO ___________# 

Quando('realizar o pagamento atraves do Mercado Pago') do
    Buy::mercado_pago_hml()
end

# _________ COMPRA LOGADO HML - PAGTO AME ___________# 

Quando('realizar o pagamento atraves da Ame') do
    Buy::pagto_ame_hml()
end
# _____________ COMPRA LOGADO PROD - PAGTO PIX _________________# 

Dado('que o cliente escolha seu lanche') do
    Login::start_facebook()
    Buy::cardapio()
    Snack::escolher_lanche("Cheddar duplo")
end
  
Dado('escolhido restaurante') do
    Snack::escolher_restaurante_prod()
end
  
Quando('clicar em Adicionar na sacola') do
    Snack::adc_sacola()
    $util.print
end
  
Quando('realizar o pagamento por Pix') do
    Buy::pix_prod()
    $util.print
end

# _________ COMPRA LOGADO PROD - PAGTO MERCADO PAGO ___________# 

Quando('realizar o pagamento pelo Mercado Pago') do
    Buy::mercado_pago_prod()
end

# _______ COMPRA LOGADO PROD - PAGTO PELO PICPAY ___________# 

Quando('realizar o pagamento pelo PicPay') do
    Buy::pagto_picpay_prod()
end

# _______ COMPRA LOGADO PROD - PAGTO PELA AME ___________# 

Quando('realizar o pagamento pela Ame') do
    Buy::pagto_ame_prod()
end

#________ COMPRA LOGADO PROD - PAGTO PELO CARTÃO DE CRÉDITO _________#
  
Quando('realizar o pagamento com cartao de credito') do
    Buy::pagto_cartao_credito()
end

#_________ CADASTRO DE FORMA DE PAGAMENTO - CARTÃO DE CRÉDITO _________#

Dado('que o usuario acesse opcao formas de pagamentos') do
    $util.login_conta_google
    Buy::adicionar_formas_pagamento()
end
  
Quando('clicar em adicionar novo pagamento') do
    Buy::adc_novo_pagto()
end
  
Quando('escolher a opcao cartao de credito') do
    Buy::escolha_cartao_credito()
end
  
Quando('preencher os dados solicitados clicando em adicionar') do
    Buy::dados_cartao()
end
  
Então('vera na tela o alert de sucesso') do
    Buy::pagamento_adc_sucess()
    $util.print
end