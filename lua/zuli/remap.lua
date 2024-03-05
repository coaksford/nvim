local ts = require('telescope.builtin')
local tsproj = require'telescope'.extensions.projects
local preview = require('goto-preview')

vim.keymap.set( 'n', '<leader>e', ':NvimTreeToggle<Enter>', { silent = true })

-- search
vim.keymap.set( 'n', '<leader>s', '', { silent = true, desc = "[S]earch" })
vim.keymap.set( 'n', '<leader>ss', ts.builtin, { silent = true, desc = "[S]earch [S]omething" })
vim.keymap.set( 'n', '<leader>sf', ts.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set( 'n', '<leader>so', ts.oldfiles, { desc = "[S]earch [O]ld files" })
vim.keymap.set( 'n', '<leader>sb', ts.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set( 'n', '<leader>sp', tsproj.projects, { desc = "[S]earch [P]rojects" })

-- resize
vim.keymap.set( 'n', '<leader>rv', ':vertical resize +5<Enter>', { silent = true, desc = "[R]esize [v]ertical +5" })
vim.keymap.set( 'n', '<leader>rV', ':vertical resize -5<Enter>', { silent = true, desc = "[R]esize [V]ertical -5" })
vim.keymap.set( 'n', '<leader>rh', ':resize +5<Enter>', { silent = true, desc = "[R]esize [h]orizantal +5" })
vim.keymap.set( 'n', '<leader>rH', ':resize -5<Enter>', { silent = true, desc = "[R]esize [H]orizontal -5" })

-- toggleterm
vim.keymap.set( 'n', '<leader>tt', ':ToggleTerm size=80 direction=float<Enter>', { silent = true, desc = "[T]oggle[T]erm centered" })
vim.keymap.set( 'n', '<leader>ts', ':ToggleTerm size=80 direction=vertical<Enter>', { silent = true, desc = "[T]oggleTerm [S]ide" })

-- buffer switching
vim.keymap.set( 'n', '<leader>tn', ':bnext<Enter>', { silent = true, desc = "Next buffer" })
vim.keymap.set( 'n', '<leader>th', ':bprev<Enter>', { silent = true, desc = "Previous buffer" })
vim.keymap.set( 'n', '<leader>tc', ':split<Enter>', { silent = true, desc = "Horizontal split" })
vim.keymap.set( 'n', '<leader>tn', ':vsplit<Enter>', { silent = true, desc = "Vertical split" })

vim.keymap.set( 'n', '_', ':split<Enter>', { silent = true, desc = "Horizontal split" })
vim.keymap.set( 'n', '|', ':vsplit<Enter>', { silent = true, desc = "Vertical split" })
vim.keymap.set( 'n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = "[R]e[n]ame"})

vim.keymap.set( 't', '<C-h>', [[<C-\><C-n><C-W>h]], { silent = true, desc = "Switch windows left"})
vim.keymap.set( 't', '<C-j>', [[<C-\><C-n><C-W>j]], { silent = true, desc = "Switch windows down"})
vim.keymap.set( 't', '<C-k>', [[<C-\><C-n><C-W>k]], { silent = true, desc = "Switch windows up"})
vim.keymap.set( 't', '<C-l>', [[<C-\><C-n><C-W>l]], { silent = true, desc = "Switch windows right"})

vim.keymap.set( 'n', '<C-h>', [[<C-W>h]], { silent = true, desc = "Switch windows left"})
vim.keymap.set( 'n', '<C-j>', [[<C-W>j]], { silent = true, desc = "Switch windows down"})
vim.keymap.set( 'n', '<C-k>', [[<C-W>k]], { silent = true, desc = "Switch windows up"})
vim.keymap.set( 'n', '<C-l>', [[<C-W>l]], { silent = true, desc = "Switch windows right"})

-- previews
vim.keymap.set( 'n', '<leader>p', '', { silent = true, desc = "[P]review" })
vim.keymap.set( 'n', '<leader>pd', preview.goto_preview_definition, { silent = true, desc = "[P]review [D]efinition" })
vim.keymap.set( 'n', '<leader>pl', preview.goto_preview_declaration, { silent = true, desc = "[P]review dec[L]aration" })
vim.keymap.set( 'n', '<leader>pi', preview.goto_preview_implementation, { silent = true, desc = "[P]review [I]mplementation" })
vim.keymap.set( 'n', '<leader>pr', preview.goto_preview_references, { silent = true, desc = "[P]review [R]eferences" })
vim.keymap.set( 'n', '<leader>pc', preview.close_all_win, { silent = true, desc = "[P]review [C]lose" })

-- lsp
vim.keymap.set( 'n', '<leader>l', '', { silent = true, desc = "LSP"})
vim.keymap.set( 'n', '<leader>lu', ':TSUpdate', { silent = true, desc = "Treesitter Update"})

-- tab management
vim.keymap.set( 'n', '<leader>.', '', { silent = true, desc = "Tab management"})
vim.keymap.set( 'n', '<leader>..', ':tabnew<Enter>', { silent = true, desc = "New tab"})
vim.keymap.set( 'n', '<leader>.,', ':tabp<Enter>', { silent = true, desc = "Switch to previous tab" })
vim.keymap.set( 'n', '<leader>.p', ':tabn<Enter>', { silent = true, desc = "Switch to next tab" })
vim.keymap.set( 'n', '<leader>.e', ':tabclose<Enter>', { silent = true, desc = "Close current tab" })
vim.keymap.set( 'n', '<leader>.y', ':bnext<Enter>', { silent = true, desc = "Next buffer" })
vim.keymap.set( 'n', "<leader>.'", ':bprev<Enter>', { silent = true, desc = "Previous buffer" })

if vim.g.neovide and vim.fn.has("macos") then
  -- copy with cmd+C for macos
  vim.api.nvim_set_keymap('', '<D-c>', '"+y', { noremap = true, silent = true })
  -- paste with cmd+V for macos, but only in insert mode.
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
end

vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
-- map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
-- map('n', "Dw", ":call vimspector#AddWatch()<cr>")
-- map('n', "De", ":call vimspector#Evaluate()<cr>")

