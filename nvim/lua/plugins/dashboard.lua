local status, db = pcall(require, "dashboard")
if (not status) then
   return
end


local custom_header = {
"                                       ",
"                                       ",
"   ▄▀▀▀▀▄       ▄▀▀▄ ▀▄      ▄▀▀█▀▄   	",
"  █      █     █  █ █ █     █   █  █  	",
"  █      █     ▐  █  ▀█     ▐   █  ▐  	",
"  ▀▄    ▄▀       █   █          █     	",
"    ▀▀▀▀       ▄▀   █        ▄▀▀▀▀▀▄  	",
"               █    ▐       █       █ 	",
"               ▐            ▐       ▐   ",
"                   										",
}

--[[
local custom_header = {
   ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
   ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
   ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
   ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
   ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
   ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
} ]]

local custom_center = {
   {icon = "  ", icon_hl = 'Title', desc = "File Oldfiles ", desc_hl = 'String', key = "SPC f o", key_hl = 'Number', action = "Telescope oldfiles theme=dropdown"},
   {icon = "  ", icon_hl = 'Title', desc = "Find File     ", desc_hl = 'String', key = "SPC f f", key_hl = 'Number', action = "Telescope find_files find_command=rg,--hidden,--files"},
   {icon = "  ", icon_hl = 'Title', desc = "File Browser  ", desc_hl = 'String', key = "SPC f b", key_hl = 'Number', action = "Telescope file_browser theme=dropdown previewer=false"},
   {icon = "  ", icon_hl = 'Title', desc = "Find Word     ", desc_hl = 'String', key = "SPC f w", key_hl = 'Number', action = "Telescope live_grep"},
   {icon = " ",  icon_hl = 'Title', desc = "Git summary   ", desc_hl = "string", key = "SPC g s", key_hl = "Number", action = ":Git | :only<CR>"},
}
local custom_footer = function()
local footer = {'','','','','','Is it time for magic? 🎩'}
-- print(footer)
return footer
end

db.setup({
theme = 'doom',
config = {
   header = custom_header,
   center = custom_center,
   footer = custom_footer,
}
})
