--[[ FX Information ]]--
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'sd-dongleped'
author       'Samuel#0008 | Judd#7644'
version      '1.0.2'
repository   'https://github.com/juddisjudd/sd-dongleped'
description  'NoPixel Inspired Dongle Ped'

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}
