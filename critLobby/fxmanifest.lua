fx_version 'cerulean'
game 'gta5'

author 'CritteR / CritteRo / Other Lads'
description 'Lobby style menu framework.'

client_scripts {
    'client/cl_lobby_scaleform.lua',
    'client/cl_lobby_handle.lua',
    'client/cl_lobby_example.lua',
}

exports {
    "LobbyMenuGetActiveMenu",
    "LobbyMenuGetSelectedButtonParam"
}

files {
    --'runtime.png',
}