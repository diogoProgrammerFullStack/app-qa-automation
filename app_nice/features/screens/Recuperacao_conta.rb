
module Recuperacao

    def Recuperacao.login_cell
        begin
            # find_element(:id, "tv_start_app").click
            # find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #autorizar SMS
            find_element(:id, "cel").click
        rescue
            $erro = " Falha ao tentar logar com celular "
            raise $erro
        end
    end

    def Recuperacao.login_cell_novo
        begin
            ddd = rand(11..19)
            cell = rand(900000000..909999999)
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd)  #--- inserir ddd
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(cell)  #--- inserir número
            hide_keyboard # minimiza teclado do device
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
        rescue
            $erro = "falha inserir dados do celular (dados randômicos)"
            raise $erro
        end
        puts "Dados do Celular no login: (#{ddd})#{cell}"
    end

    def Recuperacao.validacao_dados
        begin
            token_by_pass = '9'
            init = 4
                while init <= 9   #usando while para implementar +1 no valor do index = init para escrever o bypass "999999"
                    find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                    init += 1
                end
            hide_keyboard  #minimiza teclado do device 
            find_element(:xpath, "//*[contains(@text, 'Cont')]").click
            find_element(:xpath, "//android.widget.EditText[@index= '1']").send_keys("306.478.950-30")
            $util.print
            find_element(:xpath, "//*[contains(@text, 'Cont')]").click
            find_element(:xpath, "//*[contains(@text, 'código')]").click
            init = 5
                while init <= 10   #usando while para implementar +1 no valor do index = init para escrever o bypass "999999"
                    find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                    init += 1
                end
            hide_keyboard  #minimiza teclado do device
            find_element(:xpath, "//*[contains(@text, 'Cont')]").click
        rescue
            $erro = "falha inserir dados para recuperação de conta (dados randômicos)"
            raise $erro
        end
        puts "Dados do CPF no login: '306.478.950-30' "
    end

    def Recuperacao.home
        begin
            sleep 2
            find_element(:id, "btn_continue").click
            find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click  #Autoriza usar localização pedido pelo app
            find_element(:accessibility_id, "Voltar").click
        rescue
            $erro = " Falha ao dar as permissões para o App "
            raise $erro
        end
    end

    def Recuperacao.home_screen
        begin
            find_element(:accessibility_id, "Início")
        rescue
            $erro = " Falha ao ver na tela o menu 'Início' "
            raise $erro
        end
    end

    def Recuperacao.logout
        begin
            find_element(:accessibility_id, "Mais").click #clica na opção Mais ... 
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado 
            find_element(:id, "btn_logout").click
            sleep 2
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout! "
            raise $erro
        end
    end
end