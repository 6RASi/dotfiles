local alpha = require ("alpha")
local dashboard = require ("alpha.themes.dashboard")

dashboard.section.header.val = {
   "                                         ",
   "   ▄▀▀▀▀▄       ▄▀▀▄ ▀▄      ▄▀▀█▀▄   	",
   "  █      █     █  █ █ █     █   █  █  	",
   "  █      █     ▐  █  ▀█     ▐   █  ▐  	",
   "  ▀▄    ▄▀       █   █          █     	",
   "    ▀▀▀▀       ▄▀   █        ▄▀▀▀▀▀▄  	",
   "               █    ▐       █       █ 	",
   "               ▐            ▐       ▐  ",
   "                   										",
}
dashboard.section.header.opts.hl = "Title"

dashboard.section.buttons.val = {
   {
      type = 'text',
      val = ' ',
      opts = {
         position = 'center',
      },
   },

   { type = 'padding', val = 2 },
   dashboard.button( "nr", " " .. " Recent files",    ":Telescope oldfiles theme=dropdown"),
   dashboard.button( "ff", " " .. " Find file",       ":Telescope find_files<CR>"),
   dashboard.button( "fb", " " .. " File Browser",    ":Telescope file_browser theme=dropdown"),
   dashboard.button( "t",  " " .. " Find text",       ":Telescope live_grep <CR>"),
   dashboard.button( "g",  " " .. " Git summary",     ":Git | :only<CR>"),
   dashboard.button( "q",  " " .. " Quit nvim",       ":qa<CR>"),
}

dashboard.opts.layout[1].val = 4
dashboard.opts.layout[3].val = 0
dashboard.section.footer.val =
'Is it time for magic? 🎩'
dashboard.section.footer.opts.hl = '@alpha.footer'
table.insert(dashboard.config.layout, 5, {
   type = 'padding',
   val = 1,
})

alpha.setup(dashboard.opts)
