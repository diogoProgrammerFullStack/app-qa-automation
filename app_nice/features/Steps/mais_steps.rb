require_relative '../screens/mais.rb'

#   Minha conta 

    Quando('clicar em menu Mais') do
        Mais::acesso() 
    end
    
    Então('será exibido a tela Minha conta') do
        expect(Mais::conta.displayed?).to be true
        $util.print
        $util.logout_home_app
    end

#   informações de cadastro   

    Quando('toca em meu nome') do
        Cadastro::acesso()
    end
    
    Então('será exibida a tela informações de cadastro') do
        expect(Cadastro::nome.displayed?).to be true
        $util.print
        $util.return
        $util.logout_home_app
    end

#  endereços
    Quando('toca em Meus endereços') do
        Endereços::acesso()
    end
    
    Então('será exibida a tela Meu Endereços') do
        expect(Endereços::cep.displayed?).to be true
        $util.print
        $util.return
        $util.logout_home_app
    end

#   formas de pagamentos 
    Quando('toca em Formas de pagamento') do
        Pagamentos::acesso()
    end
    
    Então('será exibida a tela Forma de pagamento') do
        expect(Pagamentos::cadastrados.displayed?).to be true
        $util.print
        $util.return
        $util.logout_home_app
    end

#   preferencias 
    Quando('toca em Preferencias') do
        Preferencias::acesso()
    end
    
    Então('será exibida a tela de Privacidade') do
        expect(Preferencias::ajuste.displayed?).to be true
        $util.print
        $util.return
        $util.logout_home_app
    end

#    direitos e solicitações 
    Quando('toca em Direitos') do
        Direitos::acesso()
    end
    
    Então('será exibida a tela de Direitos') do
        expect(Direitos::termo.displayed?).to be true
        $util.print
        $util.return
        $util.logout_home_app
    end

#    dúvidas 
    Quando('toca em Duvidas') do
        Duvidas::acesso()
    end
    
    Então('será exibida a tela de Duvidas') do
        expect(Duvidas::procure.displayed?).to be true
        $util.print
        $util.return
        $util.logout_home_app
    end
    
#   fale com a gente
    Quando('toca em Fale') do
        Fale::acesso()
    end
    
    Então('será exibida a tela de Fale') do
        expect(Fale::assunto.displayed?).to be true
        $util.print
        $util.return
        $util.logout_home_app
    end
