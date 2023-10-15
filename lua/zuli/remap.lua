

vim.keymap.set( 'n' , '<leader>o', ':NvimTreeToggle<Enter>', { silent = true })
vim.keymap.set( 'n' , '<leader>f', ':Telescope<Enter>', { silent = true })
vim.keymap.set( 'n' , '<leader>ss', ':Telescope<Enter>', { silent = true })
vim.keymap.set( 'n' , '<leader>tt', ':terminal<Enter>', { silent = true })
vim.keymap.set( 'n' , '<leader>tn', ':bnext<Enter>', { silent = true })
vim.keymap.set( 'n' , '<leader>th', ':bprev<Enter>', { silent = true })
vim.keymap.set( 'n' , '<leader>tc', ':split<Enter>', { silent = true })
vim.keymap.set( 'n' , '<leader>tn', ':vsplit<Enter>', { silent = true })



local ts = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', ts.find_files, {})
vim.keymap.set('n', '<leader>so', ts.oldfiles, {})
vim.keymap.set('n', '<leader>sb', ts.buffers, {})
vim.keymap.set('n', '<leader>sc', ts.builtin, {})

if vim.g.neovide and vim.fn.has("macos") then
  -- copy with cmd+C for macos
  vim.api.nvim_set_keymap('', '<D-c>', '"+y', { noremap = true, silent = true })
  -- paste with cmd+C for macos, but only in insert mode.
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
end



