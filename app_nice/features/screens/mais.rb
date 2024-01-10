module Mais

    def Mais.acesso #acessa o menu Mais
        begin
            find_element(:accessibility_id, "Mais").click
        rescue
            $erro = " Falha ao clicar no menu mais"
            raise $erro
        end
    end

    def Mais.conta
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_my_account")
        rescue
            $erro = " Falha ao validar conta "
            raise $erro
        end
    end

end

module Cadastro

    def Cadastro.acesso
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_name_menu").click
        rescue
            $erro = " falha ao clicar no nome do usuário "
            raise $erro
        end
    end

    def Cadastro.nome
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/title_form_profile")
        rescue
            $erro = " falha ao verificar as informações do cadastro "
            raise $erro
        end
    end

end

module Endereços

    def Endereços.acesso
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_address").click
        rescue
            $erro = " Falha ao clicar na opção de endereço "
            raise $erro
        end
    end

    def Endereços.cep
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tvf_current_field_edit")
        rescue
            $erro = " falha ao visualizar as informações de endereço do usuario "
            raise $erro
        end
    end

end

module Pagamentos 

    def Pagamentos.acesso
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_my_payments").click
        rescue
            $erro = " falha ao clicar nas formas de pagamento "
            raise $erro
        end
    end

    def Pagamentos.cadastrados
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_title")
        rescue
            $erro = " falha ao visualizar as informações de pagamento "
            raise $erro
        end
    end

end

module Preferencias

    def Preferencias.acesso
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_preferences").click
        rescue
            $erro = " falha ao clicar nas opções de ajuste "
            raise $erro
        end
    end

    def Preferencias.ajuste
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/title_preferences_localization")
        rescue
            $erro = " falha ao visualizar as informações de ajustes "
            raise $erro
        end
    end
end

module Direitos

    def Direitos.acesso
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_my_privacy").click
        rescue
            $erro = " falha ao clicar na opção de Direitos "
            raise $erro
        end
    end

    def Direitos.termo
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_my_privacy")
        rescue
            $erro = " falha ao visualizar as informações de direitos do usuário "
            raise $erro
        end
    end
end

module Duvidas
     
    def Duvidas.acesso
        begin
            find_element(id:"burgerking.com.br.appandroid.dev:id/tv_questions").click
        rescue
            $erro = " falha ao clicar na opção de dúvidas "
            raise $erro
        end
    end

    def Duvidas.procure
        begin
            find_element(id:"burgerking.com.br.appandroid.dev:id/title_form_help")
        rescue
            $erro = " falha ao visualizar a opção de dúvidas no app "
            raise $erro
        end
    end
end

module Fale

    def Fale.acesso
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_talk_with_us").click
        rescue
            $erro = " falha ao clicar na opção do FAQ "
            raise $erro
        end
    end

    def Fale.assunto
        begin
            find_element(id: "burgerking.com.br.appandroid.dev:id/tv_title_choice")
        rescue
            $erro = " falha ao visualizar as opções do FAQ "
            raise $erro
        end
    end
end
