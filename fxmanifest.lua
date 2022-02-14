fx_version 'cerulean'
game 'gta5'

author 'Blue_Rebel | Blue Rebel#3614'
description 'Simple promo code script made by Rebel Scripts | https://discord.gg/YJ3YzNjWDy'
version '1.3'

shared_scripts {
	'config.lua',
	'@qb-garages/config.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua'
}

lua54 'yes'
