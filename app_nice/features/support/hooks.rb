# Gancho que é executado antes de cada cenário
Before do |scenario|
  # --- Subir servidor do Appium
  driver.start_driver
  driver.manage.timeouts.implicit_wait = 30

  #instanciar classes do Util Page 
  $util = UtilPage.new

  #variaveis 
  $file_name = scenario.name.gsub(' ', '_').downcase!
  $cont = 0

  # onboarding do App 
  $util.onboarding

  if $cenario_failed == true
    $util.logout_cenario_anterior
  end
  
end

After do |scenario|
  
  # file_name = scenario.name.gsub(' ', '_').downcase!
  binary_shot = driver.screenshot_as(:base64)
  temp_shot = "logs/#{$file_name}.png"
  
  File.open(temp_shot, "wb") do |f|
    f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
  end
  
  if scenario.failed?
    erro = $erro.gsub(' ', '_').downcase!
    temp_shot = "logs/#{$file_name}_#{erro}.png"
    File.open(temp_shot, "wb") do |f|
      f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
    end

    Allure.add_attachment(
      name: "screenshot",
      type: Allure::ContentType::PNG,
      source: File.open(temp_shot),
    )
    $cenario_failed = true

    if $deslogado == true
      $cenario_failed = false
      $deslogado = false
    end
  end

  driver.quit_driver

end
