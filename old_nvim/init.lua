--local autocmd = vim.api.nvim_create_autocmd
local g = vim.g

g.magma_image_provider = "kitty"
g.magma_automatically_open_output = "v.false"

local enable_providers = {
      "python3_provider",
      "matchit",
      "ruby_provider",
      --"node_provider",
      -- and so on
    }

    for _, plugin in pairs(enable_providers) do
      vim.g["loaded_" .. plugin] = nil
      vim.cmd("runtime " .. plugin)
    end

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
