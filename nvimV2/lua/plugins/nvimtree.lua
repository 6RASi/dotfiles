vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
local status, plugin = pcall(require, 'nvim-tree')
if not status then
   print('Plugin Error: ', plugin)
   return
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    root_folder_label = false,
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },
  filters = {
    dotfiles = true,
  },
})
