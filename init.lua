-- Set up leader first so other packages can configure themselves by it.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set up plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from plugins folder.
require('lazy').setup({
  spec = { import = 'plugins' },
  checker = { enabled = false },
}, {})

-- Personalization
require('custom')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
