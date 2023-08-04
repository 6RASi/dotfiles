local status, plugin = pcall(require,'nvim-treesitter.configs')
if not status then
   print('Plugin Error: ', plugin)
   return
end
plugin.setup {
   -- Install parsers synchronously (only applied to `ensure_installed`)
   sync_install = false,

   -- Automatically install missing parsers when entering buffer
   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
   auto_install = false,

   -- List of parsers to ignore installing (for "all")
   --ignore_install = { "javascript" },

   ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
   -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
   indent = { enable = true},

   highlight = {
      enable = true, -- `false` will disable the whole extension
      use_languagetree = true,
      disable = {"css", "html" },
      rainbow = {
         enable = true,
         extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
         max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
         colors = {
            "#6699CC",
            "#5FB3B3",
            "#99C794",
            "#FAC863",
            "#f99157",
            "#EC5F67",
            "#C594C5",
         }
      },
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,

   },
}
