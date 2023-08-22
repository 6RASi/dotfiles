local status, plugin = pcall(require,'nvim-autopairs')
if not status then
    print('Error with plugin: ', plugin)
    return
end

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
