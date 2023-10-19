local ts = require('telescope.builtin')
local tsproj = require'telescope'.extensions.projects
local preview = require('goto-preview')

vim.keymap.set( 'n', '<leader>o', ':NvimTreeToggle<Enter>', { silent = true })
vim.keymap.set( 'n', '<leader>ss', ts.builtin, { silent = true, desc = "[S]earch [S]omething" })
vim.keymap.set( 'n', '<leader>sf', ts.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set( 'n', '<leader>so', ts.oldfiles, { desc = "[S]earch [O]ld files" })
vim.keymap.set( 'n', '<leader>sb', ts.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set( 'n', '<leader>sp', tsproj.projects, { desc = "[S]earch [P]rojects" })
vim.keymap.set( 'n', '<leader>tt', ':ToggleTerm size=80 direction=float<Enter>', { silent = true, desc = "[T]oggle[T]erm centered" })
vim.keymap.set( 'n', '<leader>ts', ':ToggleTerm size=80 direction=vertical<Enter>', { silent = true, desc = "[T]oggleTerm [S]ide" })
vim.keymap.set( 'n', '<leader>tn', ':bnext<Enter>', { silent = true, desc = "Next buffer" })
vim.keymap.set( 'n', '<leader>th', ':bprev<Enter>', { silent = true, desc = "Previous buffer" })
vim.keymap.set( 'n', '<leader>tc', ':split<Enter>', { silent = true, desc = "Split" })
vim.keymap.set( 'n', '<leader>pd', preview.goto_preview_definition, { silent = true, desc = "[P]review [D]efinition" })
vim.keymap.set( 'n', '<leader>pl', preview.goto_preview_declaration, { silent = true, desc = "[P]review dec[L]aration" })
vim.keymap.set( 'n', '<leader>pi', preview.goto_preview_implementation, { silent = true, desc = "[P]review [I]mplementation" })
vim.keymap.set( 'n', '<leader>pr', preview.goto_preview_references, { silent = true, desc = "[P]review [R]eferences" })
vim.keymap.set( 'n', '<leader>pc', preview.close_all_win, { silent = true, desc = "[P]review [C]lose" })

-- create a new tab
vim.keymap.set( 'n' , '<leader>..', ':tabnew<Enter>', { silent = true })
-- switch to prev tab
vim.keymap.set( 'n' , '<leader>.,', ':tabp<Enter>', { silent = true })
-- switch to next tab
vim.keymap.set( 'n' , '<leader>.p', ':tabn<Enter>', { silent = true })
-- close tab
vim.keymap.set( 'n' , '<leader>.e', ':tabclose<Enter>', { silent = true })

if vim.g.neovide and vim.fn.has("macos") then
  -- copy with cmd+C for macos
  vim.api.nvim_set_keymap('', '<D-c>', '"+y', { noremap = true, silent = true })
  -- paste with cmd+C for macos, but only in insert mode.
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

