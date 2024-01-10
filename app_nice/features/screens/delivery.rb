module Delivery


    def Delivery.acesso #Acesso ao Delivery
        find_element(:id, "burgerking.com.br.appandroid.dev:id/cl_cta_delivery").click
    end

    def Delivery.modal 
        find_element(:id, "android:id/content")
    end

    def Delivery.endereco
        find_element(:id, "burgerking.com.br.appandroid.dev:id/btn_cta_primary").click
    end
end

