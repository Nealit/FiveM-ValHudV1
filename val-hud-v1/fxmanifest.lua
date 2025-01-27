fx_version 'cerulean' 
game 'gta5'          

author 'VS'   
description 'VL Hud system V1' 
version '1.0.0'      

lua54 'yes'

client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    "html/images/serverlogo.png",
    "html/images/armor.png",
    "html/images/drink.png",
    "html/images/food.png",
    "html/images/health.png",
    "html/images/carfuel.png"
}

dependencies {
    'qb-core'
}