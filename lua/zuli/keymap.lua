local ts = require('telescope.builtin')
local tsproj = require'telescope'.extensions.projects
local preview = require('goto-preview')

-- why hit shift to get into command mode?
vim.keymap.set( 'n', ';', ':')

-- Disable horizontal scrolling with mouse 
vim.keymap.set('n', '<ScrollWheelRight>', "<Nop>", { silent = true })
vim.keymap.set('n', '<ScrollWheelLeft>', "<Nop>", { silent = true })
vim.keymap.set('n', '<S-ScrollWheelDown>', "<ScrollWheelRight>", { silent = true })
vim.keymap.set('n', '<S-ScrollWheelUp>', "<ScrollWheelLeft>", { silent = true })

-- word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- drag a visual selection up and down with J and K
vim.keymap.set( 'v', 'K', ":m '>+1<CR>gv=gv")
vim.keymap.set( 'v', 'J', ":m '<-2<CR>gv=gv")

-- search
vim.keymap.set( 'n', '<leader>s', '', { silent = true, desc = "[S]earch" })
vim.keymap.set( 'n', '<leader>ss', ts.builtin, { silent = true, desc = "[S]earch [S]omething" })
vim.keymap.set( 'n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set( 'n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set( 'n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set( 'n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set( 'n', '<leader>se', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set( 'n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set( 'n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set( 'n', '<leader>sb', ts.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set( 'n', '<leader>sp', tsproj.projects, { desc = "[S]earch [P]rojects" })
vim.keymap.set( 'n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set( 'n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set( 'n', '<leader>f', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 30, -- 70% opacity
    previewer = true, -- show the context of the highlighted option
  })
end, { desc = '[f] Fuzzily search in current buffer' })

-- resize, provide distance and then enter
vim.keymap.set( 'n', '<leader>rv', ':vertical resize +', { silent = true, desc = "[R]esize [v]ertical split +" })
vim.keymap.set( 'n', '<leader>rV', ':vertical resize -', { silent = true, desc = "[R]esize [V]ertical split -" })
vim.keymap.set( 'n', '<leader>rh', ':resize +', { silent = true, desc = "[R]esize [h]orizantal split +" })
vim.keymap.set( 'n', '<leader>rH', ':resize -', { silent = true, desc = "[R]esize [H]orizontal split -" })

-- resize
vim.keymap.set( 'n', '<C-K>', ':vertical resize +2', { silent = true, desc = "[R]esize [v]ertical split +" })
vim.keymap.set( 'n', '<C-J>', ':vertical resize -2', { silent = true, desc = "[R]esize [V]ertical split -" })
vim.keymap.set( 'n', '<C-L>', ':resize +2', { silent = true, desc = "[R]esize [h]orizantal split +" })
vim.keymap.set( 'n', '<C-H>', ':resize -2', { silent = true, desc = "[R]esize [H]orizontal split -" })


-- toggleterm
vim.keymap.set( 'n', '<leader>tt', ':ToggleTerm size=80 direction=float<Enter>', { silent = true, desc = "[T]oggle[T]erm centered" })
vim.keymap.set( 'n', '<leader>ts', ':ToggleTerm size=80 direction=vertical<Enter>', { silent = true, desc = "[T]oggleTerm [S]ide" })

-- buffer switching
vim.keymap.set( 'n', '<leader>th', ':NvimTreeToggle<Enter>', { silent = true })
vim.keymap.set( 'n', '<leader>tc', ':split<Enter>', { silent = true, desc = "Horizontal split" })
vim.keymap.set( 'n', '<leader>tn', ':vsplit<Enter>', { silent = true, desc = "Vertical split" })

vim.keymap.set( 'n', '_', ':split<Enter>', { silent = true, desc = "Horizontal split" })
vim.keymap.set( 'n', '|', ':vsplit<Enter>', { silent = true, desc = "Vertical split" })
vim.keymap.set( 'n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = "[R]e[n]ame"})

-- window switching
vim.keymap.set( 'n', '<C-h>', [[<C-W>h]], { silent = true, desc = "Switch windows left"})
vim.keymap.set( 'n', '<C-j>', [[<C-W>j]], { silent = true, desc = "Switch windows down"})
vim.keymap.set( 'n', '<C-k>', [[<C-W>k]], { silent = true, desc = "Switch windows up"})
vim.keymap.set( 'n', '<C-l>', [[<C-W>l]], { silent = true, desc = "Switch windows right"})
-- window switching, even in terminals
vim.keymap.set( 't', '<C-h>', [[<C-\><C-n><C-W>h]], { silent = true, desc = "Switch windows left"})
vim.keymap.set( 't', '<C-j>', [[<C-\><C-n><C-W>j]], { silent = true, desc = "Switch windows down"})
vim.keymap.set( 't', '<C-k>', [[<C-\><C-n><C-W>k]], { silent = true, desc = "Switch windows up"})
vim.keymap.set( 't', '<C-l>', [[<C-\><C-n><C-W>l]], { silent = true, desc = "Switch windows right"})

if not vim.fn.has("macos") then
  -- this is used to switch workspaces in macOS, so not compatible
  -- window switching with ctrl+arrow
  vim.keymap.set( 'n', '<C-left>', [[<C-W>h]], { silent = true, desc = "Switch windows left"})
  vim.keymap.set( 'n', '<C-down>', [[<C-W>j]], { silent = true, desc = "Switch windows down"})
  vim.keymap.set( 'n', '<C-up>', [[<C-W>k]], { silent = true, desc = "Switch windows up"})
  vim.keymap.set( 'n', '<C-right>', [[<C-W>l]], { silent = true, desc = "Switch windows right"})
  -- window switching with ctrl+arrow, even in terminals
  vim.keymap.set( 't', '<C-left>', [[<C-\><C-n><C-W>h]], { silent = true, desc = "Switch windows left"})
  vim.keymap.set( 't', '<C-down>', [[<C-\><C-n><C-W>j]], { silent = true, desc = "Switch windows down"})
  vim.keymap.set( 't', '<C-up>', [[<C-\><C-n><C-W>k]], { silent = true, desc = "Switch windows up"})
  vim.keymap.set( 't', '<C-right>', [[<C-\><C-n><C-W>l]], { silent = true, desc = "Switch windows right"})
end


-- previews
vim.keymap.set( 'n', '<leader>p', '', { silent = true, desc = "[P]review" })
vim.keymap.set( 'n', '<leader>pd', preview.goto_preview_definition, { silent = true, desc = "[P]review [D]efinition" })
vim.keymap.set( 'n', '<leader>pl', preview.goto_preview_declaration, { silent = true, desc = "[P]review dec[L]aration" })
vim.keymap.set( 'n', '<leader>pi', preview.goto_preview_implementation, { silent = true, desc = "[P]review [I]mplementation" })
vim.keymap.set( 'n', '<leader>pr', preview.goto_preview_references, { silent = true, desc = "[P]review [R]eferences" })
vim.keymap.set( 'n', '<leader>pc', preview.close_all_win, { silent = true, desc = "[P]review [C]lose" })

vim.keymap.set( 'n', 'gd', vim.lsp.buf.definition, { silent = true, desc = "[G]oto [D]efinition" })
vim.keymap.set( 'n', 'gr', require('telescope.builtin').lsp_references, { silent = true, desc = '[G]oto [R]eferences'})
vim.keymap.set( 'n', 'gI', require('telescope.builtin').lsp_implementations, { silent = true, desc = '[G]oto [I]mplementation'})
vim.keymap.set( 'n', '<leader>D', vim.lsp.buf.type_definition, { silent = true, desc = 'Type [D]efinition'})
vim.keymap.set( 'n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { silent = true, desc = '[D]ocument [S]ymbols'})
vim.keymap.set( 'n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { silent = true, desc = '[W]orkspace [S]ymbols'})


-- Lesser used LSP functionality
vim.keymap.set( 'n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = '[G]oto [D]eclaration'})
vim.keymap.set( 'n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { silent = true, desc = '[W]orkspace [A]dd Folder'})
vim.keymap.set( 'n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { silent = true, desc = '[W]orkspace [R]emoveFolder'})
vim.keymap.set( 'n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = '[W]orkspace [L]ist Folders'})


-- lsp
vim.keymap.set( 'n', '<leader>l', '', { silent = true, desc = "LSP"})
vim.keymap.set( 'n', '<leader>lu', ':TSUpdate<Enter>', { silent = true, desc = "Treesitter Update"})
vim.keymap.set( 'n', '<leader>ls', ':LspInfo<Enter>', { silent = true, desc = "[L]SP Info ([S]tatus)"})
vim.keymap.set( 'n', '<leader>li', function() if vim.lsp.inlay_hint then vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end end, { silent = true, desc = "toggle [L]SP [I]nlay Hints"})

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

vim.keymap.set( 'n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set( 'n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set( 'n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

