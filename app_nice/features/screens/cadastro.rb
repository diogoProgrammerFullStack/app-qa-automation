
module Cadastro

    def Cadastro.step_inicio_cadastro
        begin
            find_element(:id, "tv_start_app").click
            find_element(:id, "com.android.permissioncontroller:id/permission_allow_button").click #autorizar SMS
        rescue
            $erro = "falha ao tentar navegar no onbording do app ou autorizar SMS"
            raise $erro
        end
    end
  
    def Cadastro.step_mobile_cadastro
        begin
            find_element(:id, 'login_cell').click #--- clique na opção Entrar com celular
        rescue
            $erro = "falha ao clicar na opção Entre com celular"
        raise $erro
        end
    end
  
    def Cadastro.step_cell_cadastro  #celular com dados faltantes 
        begin
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys('11')  #--- inserir ddd
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys('90921112')  #--- inserir número
            hide_keyboard # minimiza teclado do device
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
        rescue
            $erro = "falha inserir dados do celular (dados fixos)"
        raise $erro
        end
        puts " Dados do usuário: celular (11)90921112 "
    end

    def Cadastro.step_cell_completo  #celular com todos os dados randomico para cadastro por celular 
        begin
            $ddd = rand(11..19)
            $celular = rand(900000000..909999999)
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys($ddd)  #--- inserir ddd
            find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys($celular)  #--- inserir número
            hide_keyboard # minimiza teclado do device
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
        rescue
            $erro = "falha inserir dados do celular (dados randomicos)"
            raise $erro
        end
    end

    def Cadastro.step_cell_email   #celular para cenário de cadastro de email
        begin
            ddd = rand(11..19)
            celular = rand(909000000..909999999)
            find_element(:xpath, "//android.widget.EditText[@resource-id='burgerking.com.br.appandroid.dev:id/tv_sms_ddd']").send_keys(ddd)  #--- inserir ddd
            find_element(:xpath, "//android.widget.EditText[@resource-id='burgerking.com.br.appandroid.dev:id/tv_sms_phone']").send_keys(celular)  #--- inserir número
            hide_keyboard # minimiza teclado do device
            find_element(:id, "burgerking.com.br.appandroid.dev:id/btn_validate_sms").click
        rescue
            $erro = "falha inserir dados do celular (dados randomicos)"
        raise $erro
        end
    end

    def Cadastro.step_cell_google
        begin
            ddd = "12"
            celular = "923232323" 
            find_elements(:id, "tv_sms_ddd")[0].send_keys(ddd)
            find_elements(:xpath, "tv_sms_phone")[0].send_keys(celular)
            hide_keyboard
            find_element(:id, "btn_validate_sms").click
        rescue
            $erro = "falha inserir dados do celular '(12) 92323-2323'"
            raise $erro
        end
    end

    def Cadastro.step_status_cadastro
        begin
            return celular = find_element(:xpath, "//*[@text='O celular preenchido não é válido!']")
        rescue
            $erro = "falha ao validar a mensagem: 'O celular preenchido não é válido!'"
            raise $erro
        end
    end

    def Cadastro.step_status_token
        begin
            return token_invalido = find_element(:xpath, "//*[@text='O código preenchido não é válido!']")
        rescue
            $erro = "falha ao validar a mensagem: 'O código preenchido não é válido!'"
            raise $erro
        end
    end
  
    def Cadastro.step_email
        begin
            find_element(:id, "burgerking.com.br.appandroid.dev:id/login_email").click  #--- clique na opção Entrar com e-mail 
        rescue
            $erro = " falha ao clicar na opção 'Entrar com e-mail "
            raise $erro
        end
    end
  
    def Cadastro.step_google
        begin
            find_element(:id, "burgerking.com.br.appandroid.dev:id/login_google").click  #--- clique em Entrar com Google 
        rescue
            $erro = " falha ao clicar na opção 'Entrar com conta Google "
            raise $erro
        end
    end

    def Cadastro.step_insert_email_google

        find_element(:accessibility_id, "Usar outra conta").click
        2.times do
            find_element(:xpath, "//*[@text='Criar conta']").click
        end
    
        webview = @driver.available_contexts[2]
        @driver.set_context(webview)
        name = FFaker::Name.first_name
        lastName = FFaker::Name.last_name
        find_element(:css, "#firstName").send_keys(name)
        find_element(:css, "#lastName").send_keys(lastName)
        
        @driver.set_context('NATIVE_APP')

        find_element(:xpath, "//*[@resource-id= 'identifierId']").send_keys("testebking04@gmail.com")
        hide_keyboard
        find_element(:xpath, "//android.view.View[@resource-id='identifierNext']").click       # clique próxima
        find_element(:xpath, "//android.widget.EditText[@text='']").send_keys("BKqa007159")  # inserir senha email google
        hide_keyboard
        find_element(:xpath, "//android.widget.Button[@text='Próxima']").click
    end 


    def Cadastro.step_facebook
        find_element(:id, "login_facebook").click  #--- Clique Entrar com Facebook    
    end

    def Cadastro.step_dados_facebook
        webview = @driver.available_contexts[1]
        @driver.set_context(webview)
        find_element(:css, "#m_login_email").send_keys("ritadecassiaa007@gmail.com")  # email de login
        find_element(:css, "#m_login_password").send_keys("Bkingqateste")       # senha
        find_element(:css, "#login_password_step_element > button").click    # clica em Login in
    end


    def Cadastro.step_token_fail
        token_by_pass = '9' # Bypass do token
        init = 4
        while init <= 8 # usando -while para implementar +1 no valor do index = init para escrever o bypass "99999" com um número faltante
          find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
          init += 1
        end
        find_element(:xpath, "//android.widget.EditText[@index='9']").send_keys('0')
        hide_keyboard # minimiza teclado do device
        # find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
    end

    def Cadastro.step_token_sucess_cell
        token_by_pass = '9' # Bypass do token
        sleep 3
        init = 4
            while init <= 9 # usando -while para implementar +1 no valor do index = init para escrever o bypass "99999" com um número faltante
                find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                init += 1
                sleep 2
            end
        hide_keyboard # minimiza teclado do device
        find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
    end

    def Cadastro.step_token_sucess_direto
        begin
            token_by_pass = '999999' # Bypass do token
            find_element(:id, "et_pin_entry").send_keys(token_by_pass)
            hide_keyboard # minimiza teclado do device
            find_element(:id, "btn_continue").click
        rescue
            $erro = " erro ao inserir token bypass '999999' "
            raise $erro
        end
    end


    def Cadastro.step_token_do_email
        token_by_pass = '9' # Bypass do token
        init = 4
            while init <= 9 # usando -while para implementar +1 no valor do index = init para escrever o bypass "99999" com um número faltante
                find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
                init += 1
            end
        hide_keyboard # minimiza teclado do device
        find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
    end

      
    def Cadastro.step_cpf_invalido
        
        find_element(:xpath, "//android.widget.EditText[@text='']").send_keys('767.393.829-83')
        find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
    end

    def Cadastro.step_status_cpf
        return find_element(:xpath, "//*[@text='O CPF preenchido não é válido!']")
    end

    def Cadastro.step_cpf_valido
        $cpf = FFaker::IdentificationBR.pretty_cpf
        find_element(:xpath, "//android.widget.EditText[@text='']").send_keys($cpf)
        find_element(:xpath, "//android.widget.Button[@text='Continuar']").click 
        # find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click  
    end

    def Cadastro.step_cpf_google
        find_element(:xpath, "//android.widget.EditText[@text='']").send_keys("148.638.600-80")
        find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
    end

    def Cadastro.step_melhor_email
        $email = FFaker::Internet.email
        find_element(:xpath, "//android.widget.EditText[@index='0']").send_keys($email)   # id: burgerking.com.br.appandroid.dev:id/tv_email    xpath: //android.widget.EditText[@index='0']   ids.first, "burgerking.com.br.appandroid.dev:id/tv_email"                    
        find_element(:id, "burgerking.com.br.appandroid.dev:id/btn_validate_email").click
    end

    def Cadastro.step_entre_email
        begin
            email = FFaker::Internet.email
            puts "E-mail do login: #{email}"
            find_element(:xpath, "//android.widget.EditText[@index='1']").send_keys(email)   # id: burgerking.com.br.appandroid.dev:id/tv_email    xpath: //android.widget.EditText[@index='0']   ids.first, "burgerking.com.br.appandroid.dev:id/tv_email"                    
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
        rescue
            $erro = " erro ao inserir endereço de e-mail "
            raise $erro
        end
    end

    def Cadastro.step_nome
        begin
            name = FFaker::Name.first_name
            find_element(:id, "burgerking.com.br.appandroid.dev:id/et_name").send_keys(name) 
            find_element(:id, "burgerking.com.br.appandroid.dev:id/btn_confirm").click
        rescue
            $erro = " erro ao inserir nome (dado randômico) "
            raise $erro
        end
        puts "| Dados do login novo cadastro | Nome: #{name} | celular: (#{$ddd})#{$celular} | e-mail: #{$email} | CPF: #{$cpf} |"
    end

    def Cadastro.step_localiza
        begin        
            find_element(:id, "btn_continue").click  #autorizar localização app
            find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID
            find_element(:accessibility_id, "Voltar").click
        rescue
            $erro = " erro ao dar as permissões de localização ao logar no App "
            raise $erro
        end
    end

    def Cadastro.step_screen_home
        begin
            find_element(:accessibility_id, "Início").click
        rescue
            $erro = " Erro ao verificar a Tela 'HOME' "
            raise $erro
        end
    end

    def Cadastro.step_ler_termos
        begin
            find_element(:id, "burgerking.com.br.appandroid.dev:id/bt_read_terms").click   # Ler os termos de uso 
            find_element(:id, "burgerking.com.br.appandroid.dev:id/iv_container_return").click   # Voltar para home 
        rescue
            $erro = " erro ao dar permissões para termos do App "
            raise $erro
        end
    end

    def Cadastro.step_dados
        begin
            find_element(:accessibility_id, "Mais").click #clica na opção Mais ... 
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado 
            $util.print
        rescue
            $erro = " erro ao acessar menu MAIS e nome do usuário logado no App "
            raise $erro
        end
    end

    def Cadastro.step_logout
        begin
            find_element(:id, "btn_logout").click # apenas clique em sair da conta no menu mais deslogando usuário do app 
            find_element(:id, "login_bk")
        rescue
            $erro = " erro ao clicar em 'Sair do App' "
            raise $erro
        end
    end

    def Cadastro.token_valido_prod
        begin
            sleep 2
            sms = find_element(:xpath, "/hierarchy/android.widget.Toast").text
            sms.scan(/./)
        
            find_element(:xpath, "//android.widget.EditText[@index='4']").send_keys(sms[7])
            find_element(:xpath, "//android.widget.EditText[@index='5']").send_keys(sms[8])
            find_element(:xpath, "//android.widget.EditText[@index='6']").send_keys(sms[9])
            find_element(:xpath, "//android.widget.EditText[@index='7']").send_keys(sms[10])
            find_element(:xpath, "//android.widget.EditText[@index='8']").send_keys(sms[11])
            find_element(:xpath, "//android.widget.EditText[@index='9']").send_keys(sms[12])
            hide_keyboard # minimiza teclado do device
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
        rescue
            $erro = " falha ao tentar capturar token por sms na tela! "
            raise $erro
        end
    end

    def Cadastro.cpf_invalido_prod
        begin
            find_element(:xpath, "//*[@text='Digitar meu CPF']").click
            find_element(:xpath, "//android.widget.EditText[@text='']").send_keys('767.393.829-83')
            find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
        rescue
            $erro = " falha ao inserir CPF! "
            raise $erro
        end
    end
end
