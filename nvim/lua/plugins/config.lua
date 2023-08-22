local opt = vim.opt

-- other
opt.clipboard = "unnamedplus"   -- enable system clipboard
opt.termguicolors = true        -- enables RGB colors
opt.wrap = true                 -- wrap text
opt.mouse = "a"                 -- enable mouse


-- files 
opt.ignorecase = true           -- ignore case when completing file names
opt.smartcase = true            -- no ignore case when pattern has uppercase
opt.undofile = true             -- save undo information in a file

-- numbers
opt.number = true               -- line number
opt.numberwidth = 2             -- width of number column
opt.ruler = false               -- disable ruler

-- indents
opt.smartindent = true          -- smart autoindenting for C programs
opt.tabstop = 2                 -- spaces per tab
opt.softtabstop = 2             -- spaces per tab 
opt.shiftwidth = 2              -- spaces per indent




