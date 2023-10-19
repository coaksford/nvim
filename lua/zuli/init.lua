require('zuli.rust')
require('zuli.neovide')
require('zuli.remap')
require('zuli.terminal')
require('zuli.colors')


vim.wo.relativenumber = true
vim.opt.scrolloff = 10
vim.o.tabstop = 4

require('telescope').load_extension('projects')
require("startup").setup({theme = "dashboard"}) 

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

