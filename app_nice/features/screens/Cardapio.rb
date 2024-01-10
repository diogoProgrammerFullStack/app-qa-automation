require_relative '../screens/UtilPage'
module Cardapio

    def Cardapio.step_deslogado
        $deslogado = true
        begin
            # find_element(:id, "tv_start_app").click
            #     if $ambiente == "android_hml"
            #         find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #autorizar SMS
            #     end
            sleep 2
            find_element(:id, "ignore_login").click #iniciar sessão sem login 
            find_element(:id, "btn_continue").click  #aceite termos 
            find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click # permitir localização do app
            find_element(:accessibility_id, "Voltar").click
        rescue
            $erro = "falha ao tentar navegar no onbording do app deslogado"
            raise $erro
        end
    end

    def Cardapio.step_cardapio
        begin
            find_element(:id, "cl_cta_menu").click
        rescue
            $erro = " Falha ao tentar clicar em Cardápio! "
            raise $erro
        end
    end

    def Cardapio.selecionar_restaurante
        begin
            sleep 3
            find_element(:id, "tv_name_status").click
        rescue
            $erro = " Falha ao tentar clicar em 'Selecionar Restaurante' "
            raise $erro
        end
    end

    def Cardapio.escolher_restaurante()
        if $ambiente == "android_hml"  #"Labinho E-deploy"
            especifico = "Labinho E-deploy"
        elsif 
            $ambiente == "android_prod"
            especifico = "Shop. Tamboré"
        else
            " Tipo de ambiente do teste não capturado em escolher restaurante! "
        end
            begin
                sleep 3
                find_element(:id, "edtt_store_search").send_keys(especifico)
                $util.print
                sleep 3
                find_elements(:id, "tv_stores_name")[0].click
            rescue
                $erro = " Falha ao inserir nome do restaurante ou selacionar o escolhido! "
                raise $erro
            end
    end

    def Cardapio.return_home
        find_element(:id, "iv_container_return").click
    end

    def Cardapio.menu_mais
        find_element(:accessibility_id, "Mais").click
    end

    def Cardapio.inf_cadastro
        find_element(:id, "cl_name_email").click
    end
    
    def Cardapio.logout
        find_element(:id, "btn_logout").click
    end

    def Cardapio.screen_logout
        find_element(:id, 'login_bk')
    end
    
    def Cardapio.validando_restaurante
        begin
            find_element(:id, "tv_store_name")
        rescue
            $erro = " Falha ao validar restaurante! "
            raise $erro
        end
    end

    def Cardapio.step_screen
        find_element(:id, "tv_container_title")
    end

    def Cardapio.step_king_screen
        find_element(:xpath, "//*[@text='KING OFERTAS']")
    end

    def Cardapio.step_carne_screen
        find_element(:xpath, "//*[@text='CARNE']")
    end

    def Cardapio.step_frango_screen
        find_element(:xpath, "//*[@text='FRANGO + VEGGIE']")
    end

    def Cardapio.step_kingjr_screen
        find_element(:xpath, "//*[@text='KING JR®']").click
    end 

    def Cardapio.step_acompanhamentos_screen
        find_element(:xpath, "//*[@text='ACOMPANHAMENTOS']").click
    end

    def Cardapio.step_sobremessas_screen
        find_element(:xpath, "//*[@text='SOBREMESAS']").click
    end

    def Cardapio.step_bebidas_screen
        find_element(:xpath, "//*[@text='BEBIDAS']").click
    end

    def Cardapio.primeiras_opcoes(parametro)

        case parametro
        when 'King ofertas'
            find_element(:xpath, "//*[@text='KING OFERTAS']").click
        when 'Carne'
            find_element(:xpath, "//*[@text='CARNE']").click
        when 'Frango e veggie'
            find_element(:xpath, "//*[@text='FRANGO + VEGGIE']").click
        else 
            puts "Opção escolhida é inválida"
        end
    end


    def Cardapio.scroll(ambiente)
        
        case ambiente
        when 'hml'
            find_element(:xpath, "//*[contains(@text, 'CARNE')]") 
        when 'prod'
            find_element(:xpath, "//*[contains(@text, 'TODO')]")
        else
            puts "escolha um dos ambientes que o teste será executado 'hml' ou 'prod'"
        end
        coord = { start_x: 0.90, start_y: 0.14, offset_x: 0.20, offset_y: 0.14, duration: 1000 }
        Appium::TouchAction.new.swipe(coord).perform
    end
    
    def Cardapio.scroll_duplo(ambiente)
        
        case ambiente
        when 'hml'
            find_element(:xpath, "//*[contains(@text, 'CARNE')]") 
        when 'prod'
            find_element(:xpath, "//*[contains(@text, 'TODO')]")
        else
            puts "escolha um dos ambientes que o teste será executado 'hml' ou 'prod'"
        end
        coordenada = { start_x: 0.90, start_y: 0.14, offset_x: 0.20, offset_y: 0.14, duration: 1000 }
        Appium::TouchAction.new.swipe(coordenada).perform
        Appium::TouchAction.new.swipe(coordenada).perform
    end

    def Cardapio.outras_opcoes(parametro)

        case parametro
        when 'King jr'
            find_element(:xpath, "//*[@text='KING JR®']").click

        when 'Sobremessas'
            find_element(:xpath, "//*[@text='SOBREMESAS']").click

        when 'Acompanhamentos'
            find_element(:xpath, "//*[@text='ACOMPANHAMENTOS']").click

        when 'Bebidas'
            find_element(:xpath, "//*[@text='BEBIDAS']").click
        else
            puts "Opção escolhida é inválida"
        end  
    end

    def self.scrollar_id(inicio_x)
        find_element(:id, "action_bar_root").click
        Appium::TouchAction.new.swipe(start_x: 0, start_y: 474, delta_x: 0, delta_y: 839).perform

        until exists {find_element(:xpath, inicio_x)} do
            Appium::TouchAction.new.swipe(start_x: 0, start_y: 474, delta_x: 0, delta_y: 839, durattion: 60).perform
        end
    end

    #Métodos para Cardápio Logado no App 

    def Cardapio.logado_inicio_login
        find_element(:accessibility_id, "Início").click
    end

    def Cardapio.logado_inicio
        
        2.times do
            find_element(:id, "btn_next_step").click # --- clique no botão saiba mais
            sleep 2
          end
        find_element(:id, "login_cell").click #---- clique na opção Entrar com celular
        find_element(:id, "btn_continue").click  #autorizar localização app
        find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID           
        find_element(:accessibility_id, "Voltar").click
        find_element(:accessibility_id, "Início").click
    end

    def Cardapio.logado_screen
        sleep 3    
        begin
            return find_element(:id, "tv_container_title")
        rescue
            $erro = " Falha ao encontrar o elemento com o texto: 'Cardápio' "
            raise $erro
        end
    end
    
    def Cardapio.logado_opcoes(menu)

        case menu
        
        when 'Carne'
            find_element(:xpath, "//*[contains(@text, 'HAMBURGUERES DE CARNE')]").click
        when 'Hamburgueres frango'
            find_element(:xpath, "//*[contains(@text, 'HAMBÚRGUERES DE FRANGO')]").click
        when 'Saladas'
            find_element(:xpath, "//*[contains(@text, 'SALADAS')]").click
        when 'King Jr'
            find_element(:xpath, "//*[contains(@text, 'KING JR')]").click
        when 'Acompanhamentos'
            find_element(:xpath, "//*[contains(@text, 'ACOMP')]").click
        when 'Bebidas'
            find_element(:xpath, "//*[contains(@text, 'BEBIDAS')]").click
        when 'Sobremesas'
            find_element(:xpath, "//*[contains(@text, 'SOBRE')]").click
        when 'Ofertas'
            find_element(:xpath, "//*[contains(@text, 'OFERTAS')]").click
        when 'Todo dia'
            find_element(:xpath, "//*[contains(@text, 'TODO')]").click
        when 'King ofertas'
            find_element(:xpath, "//*[contains(@text, 'KING OFERTAS')]").click
        when 'Bovinos'
            find_element(:xpath, "//*[contains(@text, 'BOVINOS')]").click
        when 'Frango'
            find_element(:xpath, "//*[contains(@text, 'FRANGO')]").click
        else 
            puts "Opção escolhida é inválida"
        end
    end

    def Cardapio.logado_screen_opcoes
        find_element(:id, "recycler_view")
    end

    def Cardapio.logado_screen_prod
        find_elements(:id, "container_menu_option")[0]
    end

    def Cardapio.logado_restaurant
        # find_element(:id, "burgerking.com.br.appandroid.dev:id/tv_name_status").click
        sleep 2
        # find_element(:id, "burgerking.com.br.appandroid.dev:id/tv_name_status").click
        find_element(:id, "burgerking.com.br.appandroid.dev:id/cl_purchase").click
        # find_element(:id, "burgerking.com.br.appandroid.dev:id/cl_purchase").click
    end

    def Cardapio.logado_retirar
        find_element(:id, "tv_container_title")
    end

    def Cardapio.logado_logout
        # deslogando usuário do app 
        find_element(:accessibility_id, "Mais").click #clica na opção Mais ... 
        find_element(:id, "cl_name_email").click #clica no nome do usuário logado 
        find_element(:id, "btn_logout")
    end

    def Cardapio.abas

        begin
            find_element(:accessibility_id, "TODO DIA")
            $util.print
            find_element(:accessibility_id, "KING OFERTAS").click
            $util.print
            find_element(:accessibility_id, "CARNE").click
            $util.print
            find_element(:accessibility_id, "FRANGO + VEGGIE").click
            $util.print
            find_element(:accessibility_id, "SOBREMESAS").click
            $util.print
            find_element(:accessibility_id, "ACOMPANHAMENTOS").click
            $util.print
            find_element(:accessibility_id, "BEBIDAS").click
            $util.print
        rescue
            $erro = " Falha ao tentar navegar entre as Abas de Cardápio! "
            raise $erro
        end
    end

    def Cardapio.abas_prod
        begin
            find_element(:xpath, "//*[contains(@text, 'WHOPPER ESPECIAIS')]")
            $util.print
            find_element(:xpath, "//*[contains(@text, 'MEGA STACKER')]").click
            $util.print
            find_element(:xpath, "//*[contains(@text, 'FAVORITOS')]").click
            $util.print
            find_element(:xpath, "//*[contains(@text, 'BK ESPECIAIS')]").click
            $util.print
            find_element(:xpath, "//*[contains(@text, 'KING JR®')]").click
            $util.print
            find_element(:xpath, "//*[contains(@text, 'ACOMPANHAMENTOS')]").click
            $util.print
            find_element(:xpath, "//*[contains(@text, 'SOBREMESAS')]").click
            $util.print
            find_element(:xpath, "//*[contains(@text, 'BEBIDAS')]").click
            $util.print
        rescue
            $erro = " Falha ao tentar navegar entre as Abas de Cardápio! "
            raise $erro
        end
    end

    def Cardapio.opcoes
        begin
            find_elements(:id, "container_menu_option")[0]
        rescue
            $erro = " Falha ao Validar as opções de lanches do Cardápio! "
            raise $erro
        end
    end

    def Cardapio.todas_opcoes
        begin
            find_element(:xpath, "//*[contains(@text, 'TODO')]").click
            find_elements(:id, "container_menu_option")
            find_element(:xpath, "//*[contains(@text, 'KING OFERTAS')]").click
            find_elements(:id, "container_menu_option")
            find_element(:xpath, "//*[contains(@text, 'BOVINOS')]").click
            find_elements(:id, "container_menu_option")
            find_element(:xpath, "//*[contains(@text, 'FRANGO')]").click
            find_elements(:id, "container_menu_option")
            find_element(:xpath, "//*[contains(@text, 'KING JR')]").click
            find_elements(:id, "container_menu_option")
            find_element(:xpath, "//*[contains(@text, 'SOBRE')]").click
            find_elements(:id, "container_menu_option")
            find_element(:xpath, "//*[contains(@text, 'ACOMP')]").click
            find_elements(:id, "container_menu_option")
            find_element(:xpath, "//*[contains(@text, 'BEBIDAS')]").click
        rescue
            $erro = " Não conseguiu navegar nas abas de Cardápio e validar os itens disponiveis! "
            raise $erro
        end
    end

end