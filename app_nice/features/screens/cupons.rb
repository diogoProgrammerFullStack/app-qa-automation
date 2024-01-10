module Cupons

    def Cupons.deslogado
        $deslogado = true
        begin
            # find_element(:id, "tv_start_app").click
            find_element(:id, "ignore_login").click
            find_element(:id, "btn_continue").click
            find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click
            find_element(:accessibility_id, "Voltar").click
        rescue
            $erro = " Falha ao tentar navegar deslogado no App "
            raise $erro
        end
    end

    def Cupons.logado
        begin
            # find_element(:id, "tv_start_app").click
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #autorizar SMS
            sleep 3
            find_element(:id, "login_google").click #---- clique na opção Entrar com google
            find_element(:id, "btn_continue").click  #autorizar localização app
            find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID
            find_element(:accessibility_id, "Voltar").click
        rescue
            $erro = " Falha ao tentar realizar login "
            raise $erro
        end
    end

    def Cupons.clicar_cupons
        begin
            find_element(:id, "cl_cta_coupon").click
            if find_element(:id, "tv_title").text == "Que tal receber cupons e promoções especiais?"
                find_element(:id, "btn_enable_location").click
                find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click
            end
        rescue
            $erro = " Falha ao tentar clicar na opção 'Cupons' "
            raise $erro
        end
    end

    def Cupons.tela_cupons
        begin
            find_element(:id, "tv_container_title")
            $util.print
        rescue
            $erro = " Falha ao ver a tela de Cupons "
            raise $erro
        end
    end

    def Cupons.opcao(cupom)

        case cupom
        when "carne"
            find_element(:xpath, "//*[contains(@text, 'CARNE')]").click
        when "acompanhamentos"
            find_element(:xpath, "//*[contains(@text, 'ACOMP')]").click
        when "sobremesas"
            find_element(:xpath, "//*[contains(@text, 'SOBRE')]").click
        when "pra matar a fome"
            find_element(:xpath, "//*[contains(@text, 'FOME')]").click
        else 
            puts "Opção escolhida é inválida"
        end
    end

    def Cupons.scroll

        find_element(:accessibility_id, "CARNE")
        sleep 3
        coord = { start_x: 0.91, start_y: 0.23, offset_x: 0.14, offset_y: 0.23, duration: 1000 }
        Appium::TouchAction.new.swipe(coord).perform
    end

    def Cupons.tickets
        find_element(:id, "vp_tab_pager")        
    end

    def Cupons.escolhido
        find_element(:id, "background_image").click        
    end
    
    def Cupons.pegar_cupom
        find_element(:id, "cl_get_this_coupon").click        
    end

    def Cupons.caixa_totem
        find_element(:id, "btn_restaurant").click        
    end

    def Cupons.resgate_sucesso
        find_element(:id, "text_redeemed")        
    end

    def Cupons.no_app
        find_element(:id, "btn_no_contact").click
    end

    def Cupons.restaurante
        find_element(:id, "recycler_view_stores")
    end

    def Cupons.confirmar_estado
        begin
            find_element(:id, "tv_location")
            $util.print
            find_element(:id, "btn_continue").click
        rescue
            $erro = " Falha ao tentar clicar na opção 'Continuar' "
            raise $erro
        end
    end

    def Cupons.quero_alterar
        begin
            find_element(:id, "tv_change_location").click
        rescue
            $erro = " Falha ao tentar clicar na opção 'Quero alterar' "
            raise $erro
        end
    end
    
    def Cupons.inserir_estado
        begin
            find_element(:id, "edtt_store_search").send_keys("Rio de janeiro")
            find_element(:id, "tv_state").click
            $util.print
            find_element(:id, "tv_change_location").click
        rescue
            $erro = " Falha ao tentar inserir Estado "
            raise $erro
        end
    end

    def Cupons.verifica_estado
        estado = find_element(:id, "tv_state_name") 
        estado.text == "Rio de Janeiro (RJ)"
    end

    def Cupons.verifica_cupons
        sleep 3
        begin
            find_elements(:id, "background_image")[0]  # 1° cupom
        rescue
            $erro = " Não existem Cupons cadastrados para aba ! "
            raise $erro
        end
    end

    def Cupons.opcoes_geo(aba)
        begin
            case aba
            when "Mais"
                find_element(:accessibility_id, "MAIS PEDIDAS").click
            when "Combos"
                find_element(:accessibility_id, "COMBOS E UPGRADES").click
            when "Pra você"
                find_element(:accessibility_id, "PRA VOCÊ").click
            when "Carne"
                find_element(:accessibility_id, "CARNE").click
            when "Frango"
                find_element(:accessibility_id, "FRANGO + VEGGIE").click
            when "Sobremesas"
                find_element(:accessibility_id, "SOBREMESAS").click
            when "Acompanhamentos"
                find_element(:accessibility_id, "ACOMPANHAMENTOS").click
            when "Promoção"
                find_element(:accessibility_id, "PROMOÇÃO").click
            else
                puts "Opção escolhida é inválida"
            end
        rescue
            $erro = " Erro ao localizar Aba na tela do App ! "
            raise $erro
        end
    end

    def Cupons.scroll_geo
        begin
            sleep 3
            find_element(:accessibility_id, "MAIS PEDIDAS")
            coord = { start_x: 0.93, start_y: 0.23, offset_x: 0.18, offset_y: 0.23, duration: 800 }
            Appium::TouchAction.new.swipe(coord).perform
        rescue
            $erro = " Falha ao tentar scrollar as abas de Cupons! "
            raise $erro
        end
    end

    def Cupons.logout
        begin
            find_element(:id, "iv_container_return").click
            find_element(:accessibility_id, "Mais").click #clica na opção Mais ... 
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado 
            find_element(:id, "btn_logout").click
            sleep 2
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao executar logout do usuário no App "
            raise $erro
        end
    end
end