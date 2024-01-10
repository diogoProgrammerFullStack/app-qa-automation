#-------------------------------------- Escolhendo Lanche ----------------------------------- # 
  
module Snack
    def Snack.escolher_lanche_frango #HML
        begin
            find_element(:xpath, "//*[contains(@text, 'FRANGO')]").click
            find_element(:xpath, "//*[contains(@text, 'BBQ')]").click  #clique no 1° lanche
            find_element(:id, 'cl_pay_by_app').click
        rescue
            $erro = " Erro ao selecionar lanche de Frango ou clicar na opção 'Pagar pelo App' "
            raise $erro
        end
    end

    def Snack.escolher_lanche_king
        begin
            find_element(:accessibility_id, "BIG KING").click
            find_element(:id, 'tv_pay_by_app').click  #clique para pagar
        rescue
            $erro = " Erro ao selecionar lanche Big King ou clicar na opção 'Pagar pelo App' "
            raise $erro
        end
    end

    def Snack.escolher_lanche(lunch) #PROD

        case lunch
        when "big king"
            find_elements(:id, "title")[0].click
        when "Whopper"
            find_elements(:id, "title")[1].click
        when "Cheddar duplo"
            find_elements(:id, "title")[2].click
        when "Rodeio Duplo"
            find_elements(:id, "title")[3].click           
        else
            puts "escolha um lanche válido!"
        end
        find_element(:id, "cl_pay_by_app").click
    end

    def Snack.escolher_restaurante_prod #PROD
        find_element(:id, "edtt_store_search").send_keys("Shop. Tamboré")
        find_element(:id, "lv_info").click
    end

    def Snack.escolher_restaurante
        begin
            find_element(:xpath, "//*[contains(@text, 'Labinho E')]").click
            find_element(:id, "iv_burger")
            sleep 2
            find_element(:id, 'text_bottom_sheet_buy').click # botão: adicionar a sacola! 
        rescue
            $erro = " Não conseguiu selecionar o restaurante Labinho E-deploy como opção ou no botão: 'Adicionar a sacola'"
            raise $erro
        end
    end

    def Snack.adc_sacola
        find_element(:id, "iv_burger")
        sleep 4
        find_element(:id, "text_bottom_sheet_buy").click
    end
end

#________________________ Compra e Pagamento ______________________________# 

module Buy

    # def Buy.permissoes
    #     find_element(:id, "btn_continue").click  #autorizar localização app
    #     find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click   #autorização nativo ANDROID           
    #     find_element(:accessibility_id, "Voltar").click
    # end

    def Buy.cardapio
        begin
            find_element(:id, 'cl_cta_menu').click   #clique no cardapio
        rescue
            $erro = "Não conseguiu clicar na opção Cardápio "
            raise $erro
        end  
    end

    def Buy.forma_retirada
        begin
            sleep 3
            find_elements(:id, "tv_delivery_type_title")[0].click # 1° opção disponivel 
        rescue
            $erro = "Não conseguiu realizar Scroll ou navegar na carteira e escolher opção 'PIX' "
            raise $erro
        end
    end

    def Buy.forma_pagamento #HML
        begin
            find_elements(:id, "tv_delivery_type_title")
            coord = {start_x: 0.66, start_y: 0.94, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            sleep 3 # Scroll para carteira digital 
            find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click
            find_element(:xpath, "//*[contains(@text, 'Pix')]").click
            find_element(:id, "btn_confirm").click
            find_element(:id, "continue_buying").click
        rescue
            $erro = " Não conseguiu realizar Scroll ou navegar na carteira e escolher opção 'PIX' "
            raise $erro
        end
    end

    def Buy.logout_compras
        begin
            find_element(:id, "iv_container_return").click
            find_element(:accessibility_id, "Mais").click
            find_element(:id, "cl_name_email").click #clica no nome do usuário logado
            $util.print
            find_element(:id, "btn_logout").click
            find_element(:id, "login_bk")
        rescue
            $erro = " Falha ao realizar logout do usuário no App "
            raise $erro
        end
    end

    def Buy.pix_prod
        begin
            find_element(:id, "text_correct")
            sleep 3 # Scroll para carteira digital 
            coord = {start_x: 0.66, start_y: 0.94, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            find_elements(:id, "tv_delivery_type_title")[1].click
            find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click   #carteiras digitais
            find_elements(:id, "rb_digital_wallet_choose")[0].click #clicando na opção PIX na carteira
            $util.print
            find_element(:id, "btn_confirm").click
            find_element(:id, "continue_buying").click
        rescue
            $erro = " Não conseguiu realizar Scroll ou navegar na carteira e escolher opção 'PIX' "
            raise $erro
        end
    end
    
    def Buy.pagto_ame_hml
        begin
            find_element(:id,"bt_add_item").click # aumentar numero de lanches 
            find_element(:id, "text_correct")
            coord = {start_x: 0.66, start_y: 0.94, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            sleep 3 # Scroll para carteira digital 
            find_elements(:id, "tv_delivery_type_title")[1].click  #clicando na opção de retirar no balcão
            find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click  #carteiras digitais
            find_elements(:id, "rb_digital_wallet_choose")[4].click  #clicando opção AME
            find_element(:id, "btn_confirm").click
            find_element(:id, "continue_buying").click
        rescue
            $erro = " Erro ao escolher pagamento pela AME e finalizar pedido! ' "
            raise $erro
        end
    end

    def Buy.mercado_pago_hml
        begin
            find_element(:id,"bt_add_item").click # aumentar numero de lanches 
            find_element(:id, "text_correct")
            # sleep 4 # Scroll para carteira digital 
            coord = {start_x: 0.66, start_y: 0.90, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            sleep 4 # Scroll para carteira digital 
            find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click  #carteiras digitais
            find_elements(:id, "rb_digital_wallet_choose")[2].click  #clicando opção Mercado Pago hml
            $util.print
            find_element(:id, "btn_confirm").click
            find_element(:id, "continue_buying").click
        rescue
            $erro = " Não conseguiu realizar Scroll ou navegar na carteira e escolher opção 'Mercado pago' "
            raise $erro
        end
    end

    def Buy.mercado_pago_prod
        begin
            find_element(:id, "text_correct")
            coord = {start_x: 0.66, start_y: 0.94, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            sleep 3 # Scroll para carteira digital 
            find_elements(:id, "tv_delivery_type_title")[1].click  #clicando na opção de retirar no balcão
            find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click  #carteiras digitais
            find_elements(:id, "rb_digital_wallet_choose")[1].click  #clicando opção Mercado Pago hml
            $util.print
            find_element(:id, "btn_confirm").click
            find_element(:id, "continue_buying").click
        rescue
            $erro = " Erro ao escolher pagamento pelo Mercado Pago e finalizar pedido! "
            raise $erro
        end
    end

    def Buy.pagto_ame_prod
        begin
            find_element(:id,"bt_add_item").click # aumentar numero de lanches 
            find_element(:id, "text_correct")
            coord = {start_x: 0.66, start_y: 0.94, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            sleep 3 # Scroll para carteira digital 
            find_elements(:id, "tv_delivery_type_title")[1].click  #clicando na opção de retirar no balcão
            find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click  #carteiras digitais
            find_elements(:id, "rb_digital_wallet_choose")[3].click  #clicando opção AME
            find_element(:id, "btn_confirm").click
            find_element(:id, "continue_buying").click
        rescue
            $erro = " Erro ao escolher pagamento pela AME e finalizar pedido! "
            raise $erro
        end
    end

    def Buy.pagto_picpay_prod
        begin
            find_element(:id,"bt_add_item").click # aumentar numero de lanches 
            find_element(:id, "text_correct")
            coord = {start_x: 0.66, start_y: 0.94, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            sleep 3 # Scroll para carteira digital 
            find_elements(:id, "tv_delivery_type_title")[1].click  #clicando na opção de retirar no balcão
            find_element(:xpath, "//*[contains(@text, 'Carteiras')]").click  #carteiras digitais
            find_elements(:id, "rb_digital_wallet_choose")[2].click  #clicando opção AME
            find_element(:id, "btn_confirm").click
            find_element(:id, "continue_buying").click
        rescue
            $erro = " Erro ao escolher pagamento pelo PicPay e finalizar pedido! "
            raise $erro
        end
    end

    def Buy.pagto_cartao_credito
        begin
            find_element(:id,"bt_add_item").click # aumentar numero de lanches 
            find_element(:id, "text_correct")
            coord = {start_x: 0.66, start_y: 0.94, offset_x: 0.66, offset_y: 0.57, durattion: 1000}
            Appium::TouchAction.new.swipe(coord).perform
            sleep 3 # Scroll para carteira digital 
            find_elements(:id, "tv_delivery_type_title")[1].click  #clicando na opção de retirar no balcão
            find_elements(:id, "tv_payment_choice_title")[0].click # primeira opção de cartão de crédito, se estiver cadastrado
            find_element(:id, "continue_buying").click  #clique em Pagar 
            find_element(:id, "tet_payment_card_cvv").send_keys("863")   # cód verificação cartão  
            find_element(:id, "btn_confirm_payment").click
        rescue
            $erro = " Erro ao escolher pagamento cartão de crédito e finalizar pedido! "
            raise $erro
        end
    end

    def Buy.adc_forma_pagto_sacola    #opçao para adicionar pagamento na hora da compra dentro da sacola
        begin
            find_element(:id, "tv_add_payment_method").click  # Adicionar forma de pagamento 
            find_elements(:id, "tv_card_description")[0].click
            find_element(:id, "editText_cardNumber").send_keys("5502092738699965")
            find_element(:id, "editText_expiryDate").send_keys("0430")
            find_element(:id, "editText_securityCode").send_keys("682")
            find_elements(:xpath, "//android.widget.EditText")[3].send_keys("Wesley A Bastos")
            find_elements(:xpath, "//android.widget.EditText")[4].send_keys("38022236837")
            find_element(:id, "btn_add_payment").click
        rescue
            $erro = " Erro ao adicionar pagamento na hora da compra dentro da sacola "
            raise $erro
        end
    end

    def Buy.adicionar_formas_pagamento    #opção de adicionar pagamentos no Menu Mais
        begin
            find_element(:accessibility_id, "Mais").click
            find_element(:id, "cl_my_payments").click  
        rescue
            $erro = " Erro ao clicar no menu Mais e Adicionar nova forma de pagamento! "
            raise $erro
        end
    end      


    def Buy.adc_novo_pagto  # opção dentro das formas de pagamento para adicionar uma nova 
        begin
            find_element(:id, "btn_add").click
        rescue
            $erro = " Erro ao clicar em ' Adicionar nova forma de pagamento! ' "
            raise $erro
        end
    end

    def Buy.escolha_cartao_credito
        begin
            find_element(:id, "tv_payment_card_name").click
            find_elements(:id, "iv_card_description")[0].click
        rescue
            $erro = " Erro ao selecionar o cartão de crédito como forma de pagamento! "
            raise $erro
        end
    end 

    def Buy.dados_cartao
        begin
            find_element(:id, "editText_cardNumber").send_keys("5502092738699965")
            find_element(:id, "editText_expiryDate").send_keys("0430")
            find_element(:id, "editText_securityCode").send_keys("682")
            find_elements(:xpath, "//android.widget.EditText")[3].send_keys("Wesley A Bastos")
            find_elements(:xpath, "//android.widget.EditText")[4].send_keys("38022236837")
            find_element(:id, "btn_add_payment").click
        rescue
            $erro = " Não conseguiu inserir os dados e cadastrar novo cartão de crédito! "
            raise $erro
        end
    end

    def Buy.pagamento_adc_sucess
        begin
            find_element(:id, "tv_payment_added")
        rescue
            $erro = " Erro ao adicionar novo Cartão de Crédito! "
            raise $erro
        end
    end

    def Buy.status
        begin
            sleep 5
            find_element(:id, "tv_order_number")
        rescue
            $erro = " Não retornou número do pedido ou opção de pagamento não esta disponivel no momento! "
            raise $erro
        end
    end
end

module Scroll_lanches

    def Scroll_lanches.scrollar
        begin
            find_element(:xpath, "//*[contains(@text, 'CARNE')]")
            sleep 3
            coord =  { start_x: 0.96, start_y: 0.15, offset_x: 0.10, offset_y: 0.15, duration: 2000 }
            Appium::TouchAction.new.swipe(coord).perform
        rescue
            $erro = " Não retornou número do pedido! "
            raise $erro
        end
        
    end
end