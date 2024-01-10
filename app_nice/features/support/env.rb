require "allure-cucumber"
require "appium_lib"
require "appium_console"
require "pry"
require "cucumber"
require "rspec"
require "selenium-webdriver"
require "fileutils"
require "ffaker"

# Limpa os logs e os screenshots
FileUtils.rm_f(Dir.glob("logs/*.json"))
FileUtils.rm_f(Dir.glob("logs/*.png"))
FileUtils.rm_f(Dir.glob("logs_failed/*.png"))

$cenario_failed = false
$deslogado = false
$braze_inappmessage_modal = false

if ENV['hml']
    $ambiente = "android_hml"
    # puts "aaaaa #{$ambiente}"
elsif ENV['prod']
    $ambiente = "android_prod"
    # puts "bbbb #{$ambiente}"
end

#carrega as capabilities
caps = Appium.load_appium_txt file: File.expand_path("caps/#{$ambiente}.txt", __dir__), verbose: true
Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object