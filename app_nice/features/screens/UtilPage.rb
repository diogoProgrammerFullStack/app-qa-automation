require 'selenium-webdriver'
require 'nokogiri'
require 'allure-cucumber'

class UtilPage
  def print
    sleep 2
    binary_shot = driver.screenshot_as(:base64)
    temp_shot = "logs/#{$cont}_#{$file_name}.png"
    $cont += 1
    File.open(temp_shot, 'wb') do |f|
      f.write(Base64.decode64(binary_shot).force_encoding('UTF-8'))
    end

    Allure.add_attachment(
      name: 'evidencia',
      type: Allure::ContentType::PNG,
      source: File.open(temp_shot)
    )
  end

  def logout_restaurante_fechado
    begin
      find_element(:id, 'iv_container_return').click
      find_element(:id, 'iv_container_return').click
      find_element(:accessibility_id, 'Mais').click # clica na opção Mais
      find_element(:id, 'cl_name_email').click # clica no nome do usuário logado
      find_element(:id, 'btn_logout').click
      find_element(:id, 'login_bk')
    rescue 
      $erro = ' Falha ao realizar logout do usuário no App '
      raise $erro
    end
  end

  def acesso_deslogado
    $deslogado = true
      begin
        sleep 2
        find_element(:id, 'ignore_login').click # iniciar sessão sem login
        find_element(:id, 'btn_continue').click # aceite termos
        find_element(:id, 'com.android.permissioncontroller:id/permission_allow_foreground_only_button').click # permitir localização do app
        find_element(:accessibility_id, 'Voltar').click
      rescue
        $erro = 'falha ao tentar navegar no onbording do app deslogado'
        raise $erro
      end
  end

  def login_conta_google
    begin
      sleep 2
      find_element(:id, 'login_google').click #---- clique na opção Entrar com google
      # find_element(:accessibility_id, 'Wesley Bastos avilla.wesley@gmail.com').click
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
    rescue
      $erro = " Falha ao logar usuário no App pelo Google' "
      raise $erro
    end
  end

  def onboarding
    begin
      if $ambiente == "android_prod"
        if $braze_inappmessage_modal == true
          find_element(:id, "com_braze_inappmessage_modal_imageview")
          find_element(:accessibility_id, "Hoje não").click
        end
        find_element(:id, 'tv_start_app').click
      elsif $ambiente == "android_hml"
        find_element(:id, 'tv_start_app').click
      else
        puts "não conseguiu identificar o tipo de App escolhido (hml ou prod)"
      end
    rescue
      $erro = ' Falha ao navegar no onboarding do App '
      raise $erro
    end
  end

  def logout_cenario_anterior
    begin
      find_element(:id, 'login_google').click #---- clique na opção Entrar com celular
      find_element(:id, 'tv_close').click # autorizar localização app
      find_element(:accessibility_id, 'Mais').click # clica na opção Mais
      find_element(:id, 'cl_name_email').click # clica no nome do usuário logado
      $util.print
      find_element(:id, 'btn_logout').click
      find_element(:id, 'login_bk')
    rescue
      $erro = " Falha ao tentar realizar logout do usuário preso no App "
      raise $erro
    end
  end  

  def login_novo_cadastro
    begin
      find_element(:id, 'login_cell').click
      ddd = rand(11..19)
      celular = rand(900_000_000..999_999_999)
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-ddd']").send_keys(ddd) # insere ddd
      find_element(:xpath, "//android.widget.EditText[@resource-id='input-phone']").send_keys(celular) # insere numero randômico
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click # clica em continuar
      token_by_pass = '9'
      init = 4

        while init <= 9 # usando while para implementar +1 no valor do index = init para escrever o bypass "999999"
          find_element(:xpath, "//android.widget.EditText[@index='#{init}']").send_keys(token_by_pass)
          init += 1
        end
      hide_keyboard # minimiza teclado do device
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click # clica em continuar
      cpf = FFaker::IdentificationBR.pretty_cpf # gera CPF randômico
      find_element(:xpath, "//android.widget.EditText[@text='']").send_keys(cpf) # insere CPF
      find_element(:xpath, "//android.widget.Button[@text='Continuar']").click # clica em continuar
      email = FFaker::Internet.email
      find_element(:xpath, "//android.widget.EditText[@index='0']").send_keys(email) # id: burgerking.com.br.appandroid.dev:id/tv_email    xpath: //android.widget.EditText[@index='0']   ids.first, "burgerking.com.br.appandroid.dev:id/tv_email"
      find_element(:id, 'burgerking.com.br.appandroid.dev:id/btn_validate_email').click
      name = FFaker::NameBR.first_name
      find_element(:id, 'burgerking.com.br.appandroid.dev:id/et_name').send_keys(name)
      find_element(:id, 'burgerking.com.br.appandroid.dev:id/btn_confirm').click # continuar cadastro do nome

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
    rescue
      $erro = ' Falha ao realizar cadastro de novo usuário no App '
      raise $erro
    end
    puts " Usuário: #{name} / e-mail: #{email} / CPF: #{cpf} / celular (#{ddd})#{celular} "
  end

  def login_cell
    begin
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
    rescue
      $erro = " Falha ao relizar login de usuário antigo no app "
      raise $erro
    end  
    puts " Usuário: Suzana / e-mail: suzana.bk@teste.com / CPF: #{cpf} / celular (#{ddd})#{celular} "
  end

  def logout_home_app
    begin
      find_element(:accessibility_id, "Mais").click #clica na opção Mais ... 
      find_element(:id, "cl_name_email").click #clica no nome do usuário logado 
      $util.print
      find_element(:id, "btn_logout").click
      sleep 2
      find_element(:id, "login_bk")
    rescue
      $erro = " erro ao clicar em 'Sair do App' "
      raise $erro
    end
  end

  def return
    begin
      find_element(:id, 'iv_container_return').click
    rescue
      $erro = " erro ao clicar em 'Sair do App' "
      raise $erro
    end
  end
end