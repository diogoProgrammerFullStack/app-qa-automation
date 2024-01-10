#--------------------------------- Login (métodos passo-a-passo) ----------------------------#

module Login_Step
    
  def Login_Step.mobile
    sleep 3
      find_element(:id, 'login_cell').click #--- clique na opção Entrar com celular
  end

  def Login_Step.cell
      find_element(:xpath, "//*[contains(@resource-id, 'input-ddd')]").send_keys('11')  #--- inserir ddd
      find_element(:xpath, "//*[contains(@resource-id, 'input-phone')]").send_keys('909111122')  #--- inserir número
      hide_keyboard # minimiza teclado do device
      find_element(:xpath, "//*[contains(@text, 'Continuar')]").click
  end

  def Login_Step.email
      find_element(:id, "email").click  #--- clique na opção Entrar com e-mail 
  end

  def Login_Step.email_insert(email)
    begin
      find_element(:xpath, "//*[contains(@class, 'EditText')]").send_keys(email) # inserir email inválido 
    rescue
      $erro = " Falha ao inserir e-mail "
      raise $erro
    end
  end

  def Login_Step.screen
    find_element(:xpath, "//*[contains(@text, 'inválido')]")
  end

  def Login_Step.google
    begin
      find_element(:id, "burgerking.com.br.appandroid.dev:id/gmail").click  #--- clique em Entrar com Google 
    rescue
      $erro = " Falha ao clicar em 'Entrar com Google' "
      raise $erro
    end
  end

  def Login_Step.facebook
    begin
      find_element(:id, "burgerking.com.br.appandroid.dev:id/gdfg").click  #--- Clique Entrar com Facebook 
    rescue
      $erro = " Falha ao clicar em 'Entrar com Facebook' "
      raise $erro
    end
    end

  def Login_Step.token_expirado
    begin
      sleep 123
    rescue
      $erro = " Falha ao esperar a expiração do código token! "
      raise $erro
    end
  end

  def Login_Step.novo_token
    hide_keyboard
    begin
      find_element()
      find_element(:xpath, "//*[contains(@text, 'novo SMS')]")
    rescue
      $erro = " Falha ao visualizar botão com texto: 'Enviar novo SMS de validação' "
      raise $erro
    end
  end

end

#--------------------------------- Login direto pelo Celular (completo) ----------------------------#

module Login

  def self.direto
    begin
      sleep 3
      find_element(:id, "login_cell").click #---- clique na opção Entrar com celular
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys('11')
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys('909797078')
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
      token_by_pass = '9' # Bypass do token
      init = 4
        while init <= 9 # usando whil para implementar +1 no valor do index = init para escrever o bypass "999999"
          find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
          init += 1
        end
      hide_keyboard # minimiza teclado do device
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
      find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click
      find_element(:xpath, "//android.widget.EditText[@text='']").send_keys('287.727.448-98')
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click

        if $cenario_failed == false
          find_element(:id,"btn_continue").click  #Tela "Tem um Bk por aqui" botão "Continuar"
          find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID
          find_element(:accessibility_id, "Voltar").click
        elsif $cenario_failed == true
          find_element(:accessibility_id, "Início").click
          $cenario_failed = false
        else
          puts " Falha ao identificar estado do cenário e efetuar login "
        end
      # find_element(:id, "btn_continue").click  #autorizar localização app
      # find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID           
      # find_element(:accessibility_id,"Voltar").click
      puts "| Dados do login | Nome: Rafael | e-mail: exemplo@aa.com | CPF: 287.727.448-98 | celular (11)90979-7078 |"
    rescue
      $erro = " Falha ao logar usuário no App "
      raise $erro
    end
  end

  # _______________________ Usuário logado _ Opção Entrar com celular______________________# 

  def self.logado
    begin
      find_element(:id, "login_cell").click #---- clique na opção Entrar com celular
      find_element(:id, "btn_continue").click  #autorizar localização app
      find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID           
      find_element(:accessibility_id, "Voltar").click
    rescue
      $erro = " Falha ao tentar entrar no App com usuário já logado "
      raise $erro
    end
  end

  def self.start_facebook
    begin
      # sleep 3
      find_element(:id, "gdfg").click # Entrar com facebook
      find_element(:id, "btn_continue").click  #autorizar localização app
      find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID
      find_element(:accessibility_id, "Voltar").click # voltar para HOME
      find_element(:accessibility_id, "Início").click
    rescue
      $erro = " Falha ao logar usuário no App pelo Facebook "
      raise $erro
    end
  end

  def  self.logado_google
    begin
      sleep 3
      find_element(:id, "login_google").click #---- clique na opção Entrar com google
      find_element(:id, "btn_continue").click  #autorizar localização app
      find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID
      find_element(:accessibility_id, "Voltar").click
    rescue
      $erro = " Falha ao logar usuário no App com usuário já logado por uma conta Google "
      raise $erro
    end
  end

  def Login.cell_prod
    begin
      sleep 3
      find_element(:id, 'login_cell').click #--- clique na opção Entrar com celular
    rescue
      $erro = " Falha ao logar usuário no App pelo celular ' "
      raise $erro
    end
  end

  def Login.cell_dados
    begin
      find_element(:xpath, "//*[contains(@resource-id, 'input-ddd')]").send_keys('11')  #--- inserir ddd
      find_element(:xpath, "//*[contains(@resource-id, 'input-phone')]").send_keys('960980637')  #--- inserir número
      hide_keyboard # minimiza teclado do device
      find_element(:xpath, "//*[contains(@text, 'Continuar')]").click
    rescue
      $erro = " Falha ao inserir dados ddd, celular ou clicar em continuar! "
      raise $erro
    end
  end

  def Login.dados_validos
    sleep 2
    begin
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
      find_element(:xpath, "//android.widget.Button[@text='Digitar meu CPF']").click
      find_element(:xpath, "//android.widget.EditText[@text='']").send_keys('435.427.018-82')
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
      find_element(:id, "btn_continue").click  #autorizar localização app
      find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID           
      find_element(:accessibility_id, "Voltar").click
    rescue
      $erro = " Falha ao capturar código por SMS ou validar dados para login "
      raise $erro
    end
  end

end

#------------------------ TOKEN para inserção de dados inválidos  ----------------------------#

module Token
  def self.init
    begin
      find_element(:id, 'login_cell').click #---- clique na opção Entrar com celular
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys('11')
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys('909111122')
      hide_keyboard # minimiza teclado do device
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click
    rescue
      $erro = " Falha ao logar usuário no App "
      raise $erro
    end
  end

  def self.insert
    begin
      token_by_pass = '9' # Bypass do token
      init = 4
      while init <= 8 # usando -while para implementar +1 no valor do index = init para escrever o bypass "99999" com um número faltante
        find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
        init += 1
      end
      find_element(:xpath, "//android.widget.EditText[@index='9']").send_keys('0')
      hide_keyboard # minimiza teclado do device
    rescue
      $erro = " Falha ao inserir Token bypass "
      raise $erro
    end
  end

  def self.insert_token_faltante
    begin
      token_by_pass = '9' # Bypass do token
      init = 4
      while init <= 8 # usando -while para implementar +1 no valor do index = init para escrever o bypass "99999" com um número faltante
        find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
        init += 1
      end
      hide_keyboard # minimiza teclado do device
    rescue
      $erro = " Falha ao inserir token com dados faltantes "
      raise $erro
    end
  end

  def self.screen_token
    hide_keyboard
    find_element(:accessibility_id, "Não recebi o código. Reenviar SMS")
  end


  def self.code
    find_element(:xpath, "//*[@text='O código preenchido não é válido!']")
  end
end
#------------------------Login Gmail----------------------------------#
module Google

  def self.start_conta_google
    find_element(:id, "tv_start_app").click 
    sleep 5
    find_element(:id, "gmail").click #clique na opção entrar com Google
    find_element(:accessibily_id, "ALINE COELHO alinedamasceno0810@gmail.com").click
    find_element(:id, "btn_continue" ).click #autorizar localização app
    find_element(:id, "com.android.permissioncontroller:id/allow_foreground_only_radio_button").click #autorização nativo ANDROID
    find_element(:accessibility_id, "Voltar").click

  end

end