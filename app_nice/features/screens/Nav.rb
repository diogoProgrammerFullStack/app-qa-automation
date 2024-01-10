#-----------------  Módulo para navegação inicial até chegar no Keycloack --------------------- #

module Nav

  def Nav.optionslogin
    find_element(:id, 'login_bk') # apresentando as opções de login (Cel, e-mail)
  end

  def Nav.alternativelogin
    find_element(:id, "alternative_login") # apresentando as opções de login (Google e Facebook)
  end

  def Nav.login_celular
    begin
      find_element(:id, 'login_cell').click  #---- clique na opção Entrar com celular  
    rescue
      $erro = "falha ao clicar na opção Entrar com celular "
      raise $erro
    end
  end

  def Nav.login_email
    begin
      find_element(:id, "login_email").click    #---- clique na opção Entrar com email
    rescue
      $erro = "Falha ao clicar na opção Entrar com email"
      raise $erro
    end
  end

  def Nav.screenshot
    binary_shot = driver.screenshot_as(:base64)
    e = rand(001..999)
    temp_shot = "logs/#{e}_evidencia.png"
    
    File.open(temp_shot, "wb") do |f|
      f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
    end  
  end
  
  def self.logout
    begin
      find_element(:id, "iv_container_return").click
      find_element(:accessibility_id, "Mais").click #clica na opção Mais ... 
      find_element(:id, "cl_name_email").click #clica no nome do usuário logado 
      find_element(:id, "btn_logout").click
      sleep 2
      find_element(:id, "login_bk")
    rescue
      $erro = "Falha ao realizar logout"
      raise $erro
    end
  end
end


#------------------------  Módulo para uso no Keycloack ----------------------------------- #

module Keycloack

  def Keycloack.webview
    webview = @driver.available_contexts[2]
    @driver.set_context(webview)
  end

  def Keycloack.screen_celular
    screen = find_element(:xpath, "//android.widget.TextView[@text='Entre com seu celular:']")
  end

  def Keycloack.screen_email
    find_element(:xpath, "//android.widget.TextView[@text='Entre com seu e-mail:']")
    
  end

  def Keycloack.sign_in(ddd, celular)
    begin
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys ddd
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys celular
    rescue
      $erro = "Falha ao inserir DDD e número de celular"
      raise $erro
    end
  end

  def Keycloack.button_continuar
    begin
      find_element(:xpath, "//*[contains(@text, 'Cont')]").click
    rescue
      $erro = "Falha ao clicar na opção continuar"
      raise $erro
    end
  end

  def Keycloack.permissoes
    begin
      find_element(:xpath, "//*[contains(@text, 'Cont')]").click
        if find_element(:id, "tv_title").text == "Tem BK por aqui?"
          find_element(:id,"btn_continue").click  #Tela "Tem um Bk por aqui" botão "Continuar"
          find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID
          find_element(:accessibility_id, "Voltar").click
        end
    rescue
      $erro = "Falha ao clicar na opção continuar ou dar as permissões de localização no App"
      raise $erro
    end
  end

  def Keycloack.token_validacao
    begin
      token_by_pass = '9'
      init = 4
        while init <= 9   #usando while para implementar +1 no valor do index = init para escrever o bypass "999999"
          find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
          init += 1
        end
    rescue
      $erro = "Falha ao inserir token de validação no App 'HML' "
      raise $erro
    end
    hide_keyboard  #minimiza teclado do device 
  end

  def Keycloack.cel_invalido
    begin
      find_element(:xpath, "//*[contains(@text, 'não é válido!')]")
    rescue
      $erro = " Falha ao validar mensagem 'celular não é valido!'  "
      raise $erro
    end
  end

  def Keycloack.validacao_cpf
    @driver.set_context('NATIVE_APP')
    begin
      find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click
      find_element(:xpath, "//android.widget.EditText[@text='']").send_keys('435.427.018-82')
    rescue
      $erro = " Falha ao inserir CPF para validação! "
      raise $erro
    end
  end

  def Keycloack.digitar_novamente
    begin
      find_element(:xpath, "//*[contains(@text, 'Digitar')]").click
    rescue
      $erro = "Falha ao clicar em 'Digitar novamente' "
      raise $erro
    end
  end

end