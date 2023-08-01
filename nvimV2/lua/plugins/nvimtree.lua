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
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
