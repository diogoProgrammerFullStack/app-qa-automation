
module Clube

    def Clube.acesso_club
        begin
            find_element(:accessibility_id, "Clube BK").click
        rescue
            $erro = " Falha ao tentar clicar na opção 'Clube BK' "
            raise $erro
        end
    end

    def Clube.aguardando_cadastro
        begin
            find_element(:id, "tvf_title")
        rescue
            $erro = " A tela 'Seu cadastro está em andamento' não foi apresentada e novo usuário entrou direto na tela de Parabéns... "
            raise $erro
        end
    end

    def Clube.pontos_acesso_club_bk
        begin
            find_element(:accessibility_id, "Clube BK").click
            find_element(:id, "btn_next_step").click   # Tela Parabéns xxx - clique no Botão Continuar 
            sleep 3
            find_element(:id, "btn_next_step").click #Tela "O clube não tem .. "- botão "Entre no CLube BK"
        rescue
            $erro = "Erro ao nagevar para o Clube BK apresentando a tela de fogo com título: 'Ooops, tivemos um probleminha!' "
            raise $erro
        end
    end

    def Clube.meus_pontos
        begin
            find_element(:id, "btn_my_points").click #Botão Meus Pontos
        rescue
            $erro = "Erro ao clicar em meus pontos ou Clube BK apresentando a tela de fogo com título: 'Ooops, tivemos um probleminha!' "
            raise $erro
        end
    end

    def Clube.controle_de_pontos
        begin
            find_element(:id, "btn_due_date_points").click #Botão Controle de pontos
        rescue
            $erro = "Erro ao nagevar para o Clube BK apresentando a tela de fogo com título: 'Ooops, tivemos um probleminha!' "
            raise $erro
        end
    end

    def Clube.tela_controle_de_pontos
        begin
            find_element(:id, "tv_points") #Tela controle de pontos
            $util.print
        rescue
            $erro = " Erro ao nagevar para o Clube BK apresentando a tela de fogo com título: 'Ooops, tivemos um probleminha!' "
            raise $erro
        end
    end

    def Clube.extrato_login
        begin
            sleep 3
            find_element(:id, "login_cell").click
        
            ddd = 11
            celular = 909111122
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  #insere ddd
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular)  #insere numero randômico
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  # clica em continuar 
        
            token_by_pass = '9'
            init = 4
                while init <= 9   #usando while para implementar +1 no valor do index = init para escrever o bypass "999999"
                    find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                    init += 1
                end
        
            hide_keyboard  #minimiza teclado do device
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click #clica em continuar 
        
            find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click #clica em continuar para digitar cpf
        
            cpf = 27135931076
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf)  #insere CPF 
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  #clica em continuar 
        
            find_element(:id,"btn_continue").click  #Tela "Tem um Bk por aqui" botão "Continuar"
            find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click #Deny
        rescue
            $erro = " Falha ao relizar login de usuário antigo no app "
            raise $erro
        end  
        puts "| Dados do login | Nome: Suzana | e-mail: suzana.bk@teste.com | CPF: #{cpf} | celular (#{ddd})#{celular} |"
    end
    
    def Clube.acesso_club_bk
        find_element(:accessibility_id, "Clube BK").click
        find_element(:id, "btn_next_step").click # Tela " " - botão 
        sleep 3
        find_element(:id, "btn_next_step").click # Tela "É fácil pontuar"- botão "Entre no clube"s
    end
    
    def Clube.meus_pontos_extrato
        find_element(:id, "btn_my_points").click #Botão Meus Pontos
    end
    
    def Clube.extrato_club
        find_element(:id, "btn_extract").click #Botão Extrato
    end
    
    def Clube.tela_saldo_de_pontos
        find_element(:id, "burgerking.com.br.appandroid.dev:id/cl_points_info") #Tela Extrato
    end

    def Clube.mais
        begin
            find_element(:accessibility_id, "Mais").click #clica na opção Mais
        rescue
            $erro = " Falha ao clicar no Menu 'Mais' "
            raise $erro
        end
    end

    def Clube.config
        begin
            find_element(:id, "tv_configuration_club").click #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end
    end

    def Clube.tela_participacao
        begin
            find_element(:id, "text_title") #Tela "Participação do programa"
        rescue
            $erro = " Falha ao apresentar ou verificar a tela 'Participação no programa' "
            raise $erro
        end
    end

    def Clube.mais_privacidade
        find_element(:xpath, "//android.widget.TextView[@text='Mais']").click  #clica em "Mais"
    end

    def Clube.config_privacidade
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end
    end

    def Clube.privacidade
        begin
            find_element(:id, "privacy_settings_button").click
        rescue
            $erro = " Falha ao clicar na opção 'Configurar privacidade' "
            raise $erro
        end  
    end

    def Clube.tela_privacidade
        begin
            find_element(:id, "tv_container_title") #Tela de Privacidade
        rescue
            $erro = " Falha ao exibir a tela de 'Privacidade' no App "
            raise $erro
        end  
    end

    def Clube.mais_geo
        find_element(:accessibility_id, "Mais").click #clica na opção Mais ... 
    end

    def Clube.config_geo
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end
    end

    def Clube.privacidade_geo
        begin
            find_element(:id, "privacy_settings_button").click #clica em privacidade
        rescue
            $erro = " Falha ao acessar privacidade do clube "
            raise $erro
        end  
    end

    def Clube.ajustar_geo
        sleep 3
        begin
            find_element(:id, "tv_adjust_geolocation").click #Botão "Ajustar Geolocalização"
        rescue
            $erro = " Falha ao acessar ajustes de geolocalização "
            raise $erro
        end  
    end

    def Clube.tela_info_app
        begin
            find_element(:xpath, "//*[@text= 'Informações do aplicativo']")
        rescue
            $erro = " Falha ao validar a tela Informações do app "
            raise $erro
        end  
    end

    #@config_notificações_sms
    def Clube.notificações_sms_login
        begin
            # find_element(:id, "tv_start_app").click # tela de onboarding do App 
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #Permitir SMS
            find_element(:id, "login_cell").click

            ddd = 11
            celular = 909111122
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  

            token_by_pass = '9'
            init = 4
                while init <= 9
                    find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                    init += 1
                end
            hide_keyboard  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
            find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click     
            cpf = 27135931076
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  
            find_element(:id,"btn_continue").click  
            find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click
        rescue
            $erro = " Falha ao relizar login de usuário antigo no app "
            raise $erro
        end  
        puts "| Dados do login | Nome: Suzana | e-mail: suzana.bk@teste.com | CPF: #{cpf} | celular (#{ddd})#{celular} |"
    end

    def Clube.mais_sms
        begin
            find_element(:accessibility_id, "Mais").click
        rescue
            $erro = " Falha ao clicar no menu 'Mais' "
            raise $erro
        end  
    end

    def Clube.config_sms
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
            $util.print
        rescue
            $erro = " Não encontrou a opção 'Configurações do Clube BK' disponível no App "
            raise $erro
        end 
    end

    def Clube.privacidade_sms
        begin
            find_element(:id, "privacy_settings_button").click
        rescue
            $erro = " Falha ao acessar opção 'Configurar Privacidade' "
            raise $erro
        end
    end

    def Clube.habilitar_sms
        notification = find_elements(:id, "burgerking.com.br.appandroid.dev:id/switch_optIns")
        notification[0].click 
    end

    def Clube.sms_habilitado
        find_element(:id, "burgerking.com.br.appandroid.dev:id/ll_success")
    end


   #@config_notificações_app
    def Clube.login_notificações_app
        begin
            # find_element(:id, "tv_start_app").click # tela de onboarding do App 
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #Permitir SMS
            find_element(:id, "login_cell").click

            ddd = 11
            celular = 909111122
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  

            token_by_pass = '9'
            init = 4
                while init <= 9   
                    find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                    init += 1
                end
            hide_keyboard  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
            find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click 
            
            cpf = 27135931076
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  
            find_element(:id,"btn_continue").click  
            find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click
        rescue
            $erro = " Falha ao relizar login de usuário antigo no app "
            raise $erro
        end  
        puts "| Dados do login | Nome: Suzana | e-mail: suzana.bk@teste.com | CPF: #{cpf} | celular (#{ddd})#{celular} |"
    end

    def Clube.mais_app
        begin
            find_element(:accessibility_id, "Mais").click
        rescue
            $erro = " Falha ao clicr no menu 'Mais' "
            raise $erro
        end  
    end

    def Clube.config_app
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end
    end

    def Clube.privacidade_app
        find_element(:id, "burgerking.com.br.appandroid.dev:id/privacy_settings_button").click 
    end
#Continuar daqui
    def Clube.habilitar_app
        notification = find_elements(:id, "burgerking.com.br.appandroid.dev:id/switch_optIns") #Halibita o botão Notificações por aplicativo identificado por uma variável [1]
        notification[1].click
    end

    def Clube.app_habilitado
        find_element(:id, "burgerking.com.br.appandroid.dev:id/ll_success")
    end


    #@config_notificações_email
    def Clube.login_notificações_email
        begin
            # find_element(:id, "tv_start_app").click # tela de onboarding do App 
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #Permitir SMS
            find_element(:id, "login_cell").click

            ddd = 11
            celular = 909111122
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  

            token_by_pass = '9'
            init = 4
                while init <= 9   
                    find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                    init += 1
                end
            hide_keyboard  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
            find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click 
            
            cpf = 27135931076
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  
            find_element(:id,"btn_continue").click  
            find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click
        rescue
            $erro = " Falha ao relizar login de usuário antigo no app "
            raise $erro
        end  
        puts " Usuário: Suzana / e-mail: suzana.bk@teste.com / CPF: #{cpf} / celular (#{ddd})#{celular} "
    end

    def Clube.mais_email
        find_element(:accessibility_id, "Mais").click #clica na opção Mais ...  
    end

    def Clube.config_email
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end 
    end

    def Clube.privacidade_email
        find_element(:id, "burgerking.com.br.appandroid.dev:id/privacy_settings_button").click 
    end

    def Clube.habilitar_email
        notification = find_elements(:id, "burgerking.com.br.appandroid.dev:id/switch_optIns") #Halibita o botão Notificações por aplicativo identificado por uma variável [1]
        notification[2].click
    end

    def Clube.email_habilitado
        find_element(:id, "burgerking.com.br.appandroid.dev:id/ll_success")
    end

     #@config_notificações_app
     def Clube.login_notificações_app
        begin
            # find_element(:id, "tv_start_app").click # tela de onboarding do App 
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #Permitir SMS
            find_element(:id, "burgerking.com.br.appandroid.dev:id/login_cell").click

            ddd = 11
            celular = 909111122
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  

            token_by_pass = '9'
            init = 4
            while init <= 9   
            find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
            init += 1
            end

            hide_keyboard  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
            find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click 

            cpf = 27135931076
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  
        
            find_element(:id,"btn_continue").click  
            find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click
        rescue
            $erro = " Falha ao relizar login de usuário antigo no app "
            raise $erro
        end
        puts "| Dados do login | Nome: Suzana | e-mail: suzana.bk@teste.com | CPF: #{cpf} | celular (#{ddd})#{celular} |"
    end

    def Clube.mais_app
        begin
            find_element(:accessibility_id, "Mais").click
        rescue
            $erro = " Falha ao clicar no Menu 'Mais' "
            raise $erro
        end  
    end

    def Clube.config_app
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end  
    end

    def Clube.privacidade_app
        find_element(:id, "burgerking.com.br.appandroid.dev:id/privacy_settings_button").click 
    end

    def Clube.habilitar_app
        notification = find_elements(:id, "burgerking.com.br.appandroid.dev:id/switch_optIns") #Halibita o botão Notificações por aplicativo identificado por uma variável [1]
        notification[1].click
    end

    def Clube.app_habilitado
        find_element(:id, "burgerking.com.br.appandroid.dev:id/ll_success")
    end


    #@saiba_mais
    def Clube.login_saiba_mais
        begin
            # find_element(:id, "tv_start_app").click # tela de onboarding do App 
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #Permitir SMS
            find_element(:id, "burgerking.com.br.appandroid.dev:id/login_cell").click

            ddd = 11
            celular = 909111122
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  

            token_by_pass = '9'
            init = 4
                while init <= 9   
                    find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                    init += 1
                end

            hide_keyboard  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
            find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click 
            
            cpf = 27135931076
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf)
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  
            find_element(:id,"btn_continue").click  
            find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click
        rescue
            $erro = " Falha ao realizar login do usuário antigo "
            raise $erro
        end  
        puts "| Dados do login | Nome: Suzana | e-mail: suzana.bk@teste.com | CPF: #{cpf} | celular (#{ddd})#{celular} |"
    end

    def Clube.saibamais_mais
        begin
            find_element(:accessibility_id, "Mais").click
        rescue
            $erro = " Falha ao clicar no menu 'Mais' "
            raise $erro
        end
    end

    def Clube.saibamais_config
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end  
    end

    def Clube.botao_saibamais
        begin
            find_element(:id, "club_doubts_button").click
        rescue
            $erro = " Falha ao clicar na opção 'Saiba mais "
            raise $erro
        end  
    end

    def Clube.tela_duvidas_frequentes
        begin
            find_element(:id, "tv_container_title")
        rescue
            $erro = " Não conseguiu identificar a tela: 'Dúvidas frequentes' "
            raise $erro
        end  
    end


    #@regulamento_programa
    def Clube.login_regulamento
        begin
            # find_element(:id, "tv_start_app").click # tela de onboarding do App 
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #Permitir SMS
            find_element(:id, "login_cell").click

            ddd = 11
            celular = 909111122
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  

            token_by_pass = '9'
            init = 4
            while init <= 9   
            find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
            init += 1
            end

            hide_keyboard  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
        
            find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click 

            cpf = 27135931076
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf)  
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click  
        
            find_element(:id,"btn_continue").click  
            find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click
            puts "| Dados do login | Nome: Suzana | e-mail: suzana.bk@teste.com | CPF: #{cpf} | celular (#{ddd})#{celular} |"
        rescue
            $erro = " Falha realizar login de usuári antigo no App "
            raise $erro
        end  
    end

    def Clube.regulamento_mais
        begin
            find_element(:accessibility_id, "Mais").click
        rescue
            $erro = " Falha ao clicar no menu 'Mais' "
            raise $erro
        end    
    end

    def Clube.regulamento_config
        begin
            find_element(:id, "tv_configuration_club").click  #clica em "Configurações do Clube"
        rescue
            $erro = " Falha ao clicar em 'Configurações do Clube BK' "
            raise $erro
        end 
    end

    def Clube.botao_regulamento
        begin
            find_element(:id, "burgerking.com.br.appandroid.dev:id/club_terms").click
        rescue
            $erro = " Falha ao clicar em 'Regulamento do Programa' "
            raise $erro
        end 
    end

    def Clube.tela_regulamento
        begin
            find_element(:id, "tv_container_title")
        rescue
            $erro = " Não conseguiu visualizar a tela de regulamento do programa 'Clube BK' "
            raise $erro
        end 
    end

   # @meus_pedidos_clube
    def Clube.login_meus_pedidos_clube
        # find_element(:id, "tv_start_app").click # tela de onboarding do App 
        # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #Permitir SMS
        find_element(:xpath, "//android.widget.TextView[@text='Entrar com Google']").click #Login com Google
        find_element(:id, "btn_continue").click
        find_element(:id, "com.android.permissioncontroller:id/permission_deny_button").click 
    end

    def Clube.botao_pedidos
        begin
            find_element(:accessibility_id, "Pedidos").click
        rescue
            $erro = " Falha ao clicar em 'Pedidos' "
            raise $erro
        end 
    end

    def Clube.pedidos_clube
        begin
            find_elements(:id, "nav_tab")[2].click
        rescue
            $erro = " falha ao tentar clicar na opção 'Clube BK' dentro do Menu 'Pedidos' "
            raise $erro
        end
    
    end

    def Clube.tela_clube_bk
        begin
            find_elements(:id,"nav_tab")[2] #Opção Clube BK
        rescue
            $erro = " Não identificou que estava na tela do Clube BK dentro do Menu Pedidos "
            raise $erro
        end
    end

    def Clube.logout
        begin
            sleep 3
            find_element(:accessibility_id, "Mais").click #clica na opção Mais
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado
            $util.print
            find_element(:id, "btn_logout").click
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout do usuário no App "
            raise $erro
        end
    end

    def Clube.logout_pedidos
        begin
            find_element(:accessibility_id, "Mais").click #clica na opção Mais
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado
            find_element(:id, "btn_logout").click
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout do usuário no App "
            raise $erro
        end
    end

    def Clube.logout_conf_clube
        begin
            find_element(:id, "iv_container_return").click
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado
            $util.print
            find_element(:id, "btn_logout").click      
                # if find_element(:id, "com.android.permissioncontroller:id/permission_message") # id deve ser completo
                #     find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click # id deve ser completo
                # end
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout do usuário no App "
            raise $erro
        end
    end

    def Clube.logout_privacidade
        begin
            find_element(:id, "iv_container_return").click
            sleep 2
            find_element(:id, "iv_container_return").click
            find_element(:accessibility_id, "Mais").click #clica na opção Mais
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado
            $util.print
            find_element(:id, "btn_logout").click 
                # if find_element(:id, "com.android.permissioncontroller:id/permission_message") # id deve ser completo
                #     find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click # id deve ser completo
                # end
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout do usuário no App "
            raise $erro
        end
    end


    def Clube.logout_geo
        begin
            find_element(:accessibility_id, "Navegar").click
            find_element(:id, "iv_container_return").click
            sleep 2
            find_element(:id, "iv_container_return").click
            find_element(:accessibility_id, "Mais").click #clica na opção Mais
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado
            $util.print
            find_element(:id, "btn_logout").click 
                # if find_element(:id, "com.android.permissioncontroller:id/permission_message") # id deve ser completo
                #     find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click # id deve ser completo
                # end
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout do usuário no App "
            raise $erro
        end        
    end

    def Clube.logout_duvidas
        begin
            3.times do
                find_element(:id, "iv_container_return").click
                sleep 2
            end
            find_element(:accessibility_id, "Mais").click #clica na opção Mais
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado
            $util.print
            find_element(:id, "btn_logout").click 
                # if find_element(:id, "com.android.permissioncontroller:id/permission_message") # id deve ser completo
                #     find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click # id deve ser completo
                # end
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout do usuário no App "
            raise $erro
        end
    end
end
