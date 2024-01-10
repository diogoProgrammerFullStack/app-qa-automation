#-------------------------------------------- Na HOME do App ----------------------------------------#
  
module Home

    def Home.permissoes
        find_element(:id, "btn_continue").click
        find_element(:id, "com.android.permissioncontroller:id/permission_allow_foreground_only_button").click  #Autoriza usar localização pedido pelo app
        find_element(:accessibility_id, "Voltar").click
    end

    def Home.screen
        find_element(:accessibility_id, "Início")
    end
end
