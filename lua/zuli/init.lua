require('zuli.rust')
require('zuli.neovide')
require('zuli.remap')
require('zuli.terminal')
require('zuli.colors')


vim.wo.relativenumber = true
vim.opt.scrolloff = 10

require('telescope').load_extension('projects')
require("startup").setup({theme = "dashboard"}) 

