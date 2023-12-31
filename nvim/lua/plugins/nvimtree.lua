vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<space>n", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle nvimtree" })
vim.keymap.set("n", "<space>e","<cmd>NvimTreeFocus<cr>", { desc = "Focus nvimtree" })

-- OR setup with some options
local status, plugin = pcall(require, 'nvim-tree')
if not status then
   print('Plugin Error: ', plugin)
   return
end

require("nvim-tree").setup({
   sort_by = "case_sensitive",
   -- filters
   filters = {
      dotfiles = true,
   },

   -- view
   view = {
      adaptive_size = false,
      side = "left",
      width = 30,
      preserve_window_proportions = true,
   },
   git = {
      enable = false,
      ignore = true,
   },
   filesystem_watchers = {
      enable = true,
   },
   actions = {
      open_file = {
         resize_window = true,
      },
   },

   -- renderer
   renderer = {
      root_folder_label = false,
      highlight_git = false,
      highlight_opened_files = "none",

      indent_markers = {
         enable = false,
      },

      icons = {
         show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
         },

         glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
               default = "",
               empty = "",
               empty_open = "",
               open = "",
               symlink = "",
               symlink_open = "",
               arrow_open = "",
               arrow_closed = "",
            },
            git = {
               unstaged = "✗",
               staged = "✓",
               unmerged = "",
               renamed = "➜",
               untracked = "★",
               deleted = "",
               ignored = "◌",
            },
         },
      },
   },
})
