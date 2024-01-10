# Cupons com Geolocalizado no App @cupons_geolocalizado

Dado('que o usuário acesse o app do BK') do
    $util.login_conta_google
end
  
Quando('clica em cupons') do
    Cupons::clicar_cupons()
end
  
Quando('surgir o modal para confirmar o seu estado ou escolher outro') do
    Cupons::confirmar_estado()
end
  
Então('sera direcionado para tela de cupons') do
    Cupons::tela_cupons()
    Cupons::logout()
end

# @cupons_escolher_estado
Quando('ao surgir o modal escolher a opcao Quero Alterar') do
    Cupons::quero_alterar()
end
  
Quando('seleciona um estado diferente da sua localização') do
    Cupons::inserir_estado()
end
  
Então('exibe tela de cupons do estado selecionado') do
    Cupons::verifica_estado()
    Cupons::verifica_cupons()
    $util.print
    Cupons::logout()
end

# Opções de cupons _ Mais pedidas 
Dado('que o usuario acesse a opcao cupons') do
    $util.login_conta_google
    Cupons::clicar_cupons()
    Cupons::confirmar_estado()
end

Quando('clicar na opcao Mais pedidas') do
    Cupons::opcoes_geo("Mais")
end
  
Entao('serao apresentados os cupons') do    
    Cupons::verifica_cupons()
    $util.print
    Cupons::logout()
end

# Opções de cupons _ Combos e Upgrades
Quando('clicar na opcao Combos e Upgrades') do
    Cupons::opcoes_geo("Combos")
end

# Opções de cupons _ Pra você 
Quando('clicar na opcao Pra voce') do
    Cupons::opcoes_geo("Pra você")
end

# Opções de cupons _ Bovinos e Suinos 
# Quando('clicar na opcao Bovinos e suinos') do
#     Cupons::scroll_geo()
#     Cupons::opcoes_geo("Bovinos")
# end

# Opções de cupons _ Frango e Veggie
Quando('clicar na opcao Frango e Veggie') do
    Cupons::scroll_geo()
    Cupons::opcoes_geo("Frango")
end

# Opções de cupons _ Sobremesas
Quando('escolher a opcao Sobremesas') do
    Cupons::scroll_geo()
    Cupons::opcoes_geo("Sobremesas")
end

# Opções de cupons _ Acompanhamentos
Quando('escolher a opcao Acompanhamentos') do
    Cupons::scroll_geo()
    Cupons::opcoes_geo("Acompanhamentos")
end

# Opções de cupons _ Carne (apenas HML)
Quando('clicar na opcao carne') do
    Cupons::scroll_geo()
    Cupons::opcoes_geo("Carne")
end


# Opções de cupons _ Promoção (apenas HML)
Quando('clicar na opcao promocao') do
    Cupons::scroll_geo()
    Cupons::opcoes_geo("Promoção")
end

Entao('realizara logout no App') do
    Cupons::logout()
  end