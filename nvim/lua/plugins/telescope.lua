local status, plugin = pcall(require,'telescope')
if not status then
   print('Error with plugin: ', plugin)
   return
end
plugin.setup{
   defaults = {
      vimgrep_arguments = {
         "rg",
         "-L",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      mappings = {
         i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
         }
      }
   },
   pickers = {
      find_files = {
         hidden=true,
         file_ignore_patterns = { ".git/", ".undo/",".backup/"},
      },
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
   },
   extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
   },
        file_browser = {
            theme = "dropdown",
		      	previewer = false, -- override the file sorter
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    ['T'] = fb_actions.create,
                    ['a'] = fb_actions.rename,
                    ['dD'] = fb_actions.remove,
                    ['o'] = fb_actions.open,
                    ['h'] = fb_actions.goto_parent_dir,
                    ['l'] = fb_actions.change_cwd,
                    ['yy'] = fb_actions.copy,
                    ['dd'] = fb_actions.move,
                    ['gh'] = fb_actions.goto_home_dir,
                    ['vv'] = fb_actions.select_all,
                    ["backspace"] = fb_actions.toggle_hidden,
                    -- your custom normal mode mappings
                },
            },
        },

require("telescope").load_extension("file_browser")
