local tabnine = require("cmp_tabnine.config")

tabnine:setup({
   max_lines = 1000,
   max_num_results = 5,
   sort = true,
   run_on_every_keystroke = true,
   snippet_placeholder = "..",
})

local source_mapping = {
   luasnip = "[Snip]",
   cmp_tabnine = "[TN]",
   nvim_lsp = "[LSP]",
   buffer = "[Buff]",
   path = "[Path]",
}

local lspkind = require("lspkind")
local cmp = require("cmp")
local lsp = require("lspconfig")

cmp.setup({
   snippet = {
      expand = function(args)
      require("luasnip").lsp_expand(args.body)
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
         cmp.select_next_item()
      else
         fallback()
      end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
         cmp.select_prev_item()
      else
         fallback()
      end
      end, { "i", "s" }),
   }),
   sources = cmp.config.sources({
      { name = "luasnip" },
      { name = "cmp_tabnine" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "emoji"  },
      { name = "path" },
   }),
   formatting = {
      format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == "cmp_tabnine" then
         if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. " " .. menu
         end
         vim_item.kind = ""
      end
      vim_item.menu = menu
      return vim_item
      end,
   },
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "ge", ':lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', opts)
vim.api.nvim_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", ":lua vim.diagnostic.setloclist()<CR>", opts)

local on_attach = function(client, bufnr)
vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "gvd", ":vsplit <CR><C-w>l:lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "gsd", ":split <CR><C-w>l:lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-q>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fo", ":lua vim.lsp.buf.format( {timeout_ms = 5000} )<CR>", opts)
end


-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.foldingRange = {
dynamicRegistration = false,
lineFoldingOnly = true,
}


require("lsp-inlayhints").setup()
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
group = "LspAttach_inlayhints",
callback = function(args)
if not (args.data and args.data.client_id) then
   return
end

local bufnr = args.buf
local client = vim.lsp.get_client_by_id(args.data.client_id)

vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>h", ":lua require('lsp-inlayhints').toggle()<CR>", opts)
require("lsp-inlayhints").on_attach(client, bufnr)
end,
})

local servers = {
"hls",
"gopls",
"pyright",
"tflint",
"yamlls",
"vimls",
"texlab",
"html",
"emmet_ls",
"tailwindcss",
"graphql",
"dockerls",
"rnix",
"grammarly",
}

for _, server in ipairs(servers) do
lsp[server].setup({
   capabilities = capabilities,
   on_attach = on_attach,
})
end

lsp.tsserver.setup({
capabilities = capabilities,
on_attach = function(c, b)
on_attach(c, b)
end,
settings = {
   typescript = {
      inlayHints = {
         includeInlayParameterNameHints = "all",
         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
         includeInlayFunctionParameterTypeHints = true,
         includeInlayVariableTypeHints = true,
         includeInlayPropertyDeclarationTypeHints = true,
         includeInlayFunctionLikeReturnTypeHints = true,
         includeInlayEnumMemberValueHints = true,
      },
   },
   javascript = {
      inlayHints = {
         includeInlayParameterNameHints = "all",
         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
         includeInlayFunctionParameterTypeHints = true,
         includeInlayVariableTypeHints = true,
         includeInlayPropertyDeclarationTypeHints = true,
         includeInlayFunctionLikeReturnTypeHints = true,
         includeInlayEnumMemberValueHints = true,
      },
   },
},
})

lsp.jsonls.setup({
capabilities = capabilities,
on_attach = on_attach,
commands = {
   Format = {
      function()
         vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
         end,
      },
   },
})
