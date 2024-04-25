-- absolute and relative line numbers in gutter
vim.wo.relativenumber = true
vim.wo.number = true
-- keep the cursor x rows away from top or bottom
vim.opt.scrolloff = 10
-- default length of tabbing in spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- auto-detect foldable syntax, instead of managing folds manually
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- highlight search matches
vim.o.hlsearch = false
-- enable mouse
vim.o.mouse = 'a'
-- sync with OS clipboard
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
-- allow undo
vim.o.undofile = true
-- case sensitivity in searches
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'
-- key combo timings in ms
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- completion options
-- vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.completeopt = 'preview'
vim.o.termguicolors = true

