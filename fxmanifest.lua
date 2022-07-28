--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'sd-dongleped'
author       'Samuel#0008'
version      '1.0.2'
repository   'https://github.com/juddisjudd/sd-dongleped'
description  'NoPixel Inspired Dongle Ped'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
	'@ox_core/imports/client.lua',
	'client.lua',
}

server_scripts {
	'@ox_core/imports/server.lua',
	'server.lua',
}
