local ts = require('telescope.builtin')
local tsproj = require'telescope'.extensions.projects
local preview = require('goto-preview')
local tst = require('telescope.themes')
local ts_dropdown_theme = tst.get_dropdown {
  winblend = 30, -- 70% opacity
  previewer = true, -- show the context of the highlighted option
}

local map = vim.keymap.set

-- why hit shift to get into command mode?
map( 'n', ';', ':')

-- Disable horizontal scrolling with mouse 
map('n', '<ScrollWheelRight>', "<Nop>", { silent = true })
map('n', '<ScrollWheelLeft>', "<Nop>", { silent = true })
map('n', '<S-ScrollWheelDown>', "<ScrollWheelRight>", { silent = true })
map('n', '<S-ScrollWheelUp>', "<ScrollWheelLeft>", { silent = true })

-- word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- drag a visual selection up and down with J and K
map( 'v', 'K', ":m '>+1<CR>gv=gv")
map( 'v', 'J', ":m '<-2<CR>gv=gv")

-- search
map( 'n', '<leader>s', '', { silent = true, desc = "[S]earch" })
map( 'n', '<leader>ss', ts.builtin, { silent = true, desc = "[S]earch [S]omething" })
map( 'n', '<leader>sf', ts.find_files, { desc = '[S]earch [F]iles' })
map( 'n', '<leader>sh', ts.help_tags, { desc = '[S]earch [H]elp' })
map( 'n', '<leader>sw', ts.grep_string, { desc = '[S]earch current [W]ord' })
map( 'n', '<leader>sg', ts.live_grep, { desc = '[S]earch by [G]rep' })
map( 'n', '<leader>se', ts.diagnostics, { desc = '[S]earch [D]iagnostics' })
map( 'n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map( 'n', '<leader>sr', ts.resume, { desc = '[S]earch [R]esume' })
map( 'n', '<leader>sb', ts.buffers, { desc = "[S]earch [B]uffers" })
map( 'n', '<leader>sp', tsproj.projects, { desc = "[S]earch [P]rojects" })
map( 'n', '<leader><space>', ts.buffers, { desc = '[ ] Find existing buffers' })
map( 'n', '<leader>?', ts.oldfiles, { desc = '[?] Find recently opened files' })
map( 'n', '<leader>f', function() ts.live_grep(ts_dropdown_theme) end, { desc = '[fg] Fuzzily grep' })
map( 'n', '<leader>F', function() ts.current_buffer_fuzzy_find(ts_dropdown_theme) end, { desc = '[fb] Fuzzily search in current buffer' })

-- resize, provide distance and then enter
map( 'n', '<leader>rv', ':vertical resize +', { silent = true, desc = "[R]esize [v]ertical split +" })
map( 'n', '<leader>rV', ':vertical resize -', { silent = true, desc = "[R]esize [V]ertical split -" })
map( 'n', '<leader>rh', ':resize +', { silent = true, desc = "[R]esize [h]orizantal split +" })
map( 'n', '<leader>rH', ':resize -', { silent = true, desc = "[R]esize [H]orizontal split -" })

-- resize
map( 'n', '<C-K>', ':vertical resize +2', { silent = true, desc = "[R]esize [v]ertical split +" })
map( 'n', '<C-J>', ':vertical resize -2', { silent = true, desc = "[R]esize [V]ertical split -" })
map( 'n', '<C-L>', ':resize +2', { silent = true, desc = "[R]esize [h]orizantal split +" })
map( 'n', '<C-H>', ':resize -2', { silent = true, desc = "[R]esize [H]orizontal split -" })


-- toggleterm
map( 'n', '<leader>tt', ':ToggleTerm size=80 direction=float<Enter>', { silent = true, desc = "[T]oggle[T]erm centered" })
map( 'n', '<leader>ts', ':ToggleTerm size=80 direction=vertical<Enter>', { silent = true, desc = "[T]oggleTerm [S]ide" })

-- buffer switching
map( 'n', '<leader>th', ':NvimTreeToggle<Enter>', { silent = true })
map( 'n', '<leader>tc', ':split<Enter>', { silent = true, desc = "Horizontal split" })
map( 'n', '<leader>tn', ':vsplit<Enter>', { silent = true, desc = "Vertical split" })
map( 'n', '_', ':split<Enter>', { silent = true, desc = "Horizontal split" })
map( 'n', '|', ':vsplit<Enter>', { silent = true, desc = "Vertical split" })


-- window switching
map( 'n', '<C-h>', [[<C-W>h]], { silent = true, desc = "Switch windows left"})
map( 'n', '<C-j>', [[<C-W>j]], { silent = true, desc = "Switch windows down"})
map( 'n', '<C-k>', [[<C-W>k]], { silent = true, desc = "Switch windows up"})
map( 'n', '<C-l>', [[<C-W>l]], { silent = true, desc = "Switch windows right"})
-- window switching, even in terminals
map( 't', '<C-h>', [[<C-\><C-n><C-W>h]], { silent = true, desc = "Switch windows left"})
map( 't', '<C-j>', [[<C-\><C-n><C-W>j]], { silent = true, desc = "Switch windows down"})
map( 't', '<C-k>', [[<C-\><C-n><C-W>k]], { silent = true, desc = "Switch windows up"})
map( 't', '<C-l>', [[<C-\><C-n><C-W>l]], { silent = true, desc = "Switch windows right"})

-- previews
map( 'n', '<leader>p', '', { silent = true, desc = "[P]review" })
map( 'n', '<leader>pd', preview.goto_preview_definition, { silent = true, desc = "[P]review [D]efinition" })
map( 'n', '<leader>pl', preview.goto_preview_declaration, { silent = true, desc = "[P]review dec[L]aration" })
map( 'n', '<leader>pi', preview.goto_preview_implementation, { silent = true, desc = "[P]review [I]mplementation" })
map( 'n', '<leader>pr', preview.goto_preview_references, { silent = true, desc = "[P]review [R]eferences" })
map( 'n', '<leader>pc', preview.close_all_win, { silent = true, desc = "[P]review [C]lose" })

map( 'n', 'gd', vim.lsp.buf.definition, { silent = true, desc = "[G]oto [D]efinition" })
map( 'n', 'gr', ts.lsp_references, { silent = true, desc = '[G]oto [R]eferences'})
map( 'n', 'gI', ts.lsp_implementations, { silent = true, desc = '[G]oto [I]mplementation'})
map( 'n', '<leader>D', vim.lsp.buf.type_definition, { silent = true, desc = 'Type [D]efinition'})
map( 'n', '<leader>ds', ts.lsp_document_symbols, { silent = true, desc = '[D]ocument [S]ymbols'})
map( 'n', '<leader>ws', ts.lsp_dynamic_workspace_symbols, { silent = true, desc = '[W]orkspace [S]ymbols'})

-- Lesser used LSP functionality
map( 'n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = '[G]oto [D]eclaration'})
map( 'n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { silent = true, desc = '[W]orkspace [A]dd Folder'})
map( 'n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { silent = true, desc = '[W]orkspace [R]emoveFolder'})
map( 'n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = '[W]orkspace [L]ist Folders'})

-- lsp
map( 'n', '<leader>l', '', { silent = true, desc = "LSP"})
map( 'n', '<leader>lu', ':TSUpdate<Enter>', { silent = true, desc = "Treesitter Update"})
map( 'n', '<leader>ls', ':LspInfo<Enter>', { silent = true, desc = "[L]SP Info ([S]tatus)"})
map( 'n', '<leader>li', function() if vim.lsp.inlay_hint then vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end end, { silent = true, desc = "toggle [L]SP [I]nlay Hints"})
map( 'n', '<leader>ca', function() vim.lsp.buf.code_action({apply=true}) end, { silent = true, desc = "[C]ode [A]ction"})
map( 'n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = "[R]e[n]ame"})
map( 'n', '<leader>lt', ':lua Toggle_LSP()<Enter>', { silent = true, desc = "[L]SP [T]oggle"})

-- tab management
map( 'n', '<leader>.', '', { silent = true, desc = "Tab management"})
map( 'n', '<leader>..', ':tabnew<Enter>', { silent = true, desc = "New tab"})
map( 'n', '<leader>.,', ':tabp<Enter>', { silent = true, desc = "Switch to previous tab" })
map( 'n', '<leader>.p', ':tabn<Enter>', { silent = true, desc = "Switch to next tab" })
map( 'n', '<leader>.e', ':tabclose<Enter>', { silent = true, desc = "Close current tab" })
map( 'n', '<leader>.y', ':bnext<Enter>', { silent = true, desc = "Next buffer" })
map( 'n', "<leader>.'", ':bprev<Enter>', { silent = true, desc = "Previous buffer" })

if vim.g.neovide and vim.fn.has("macos") then
  -- copy with cmd+C for macos
  vim.api.nvim_set_keymap('', '<D-c>', '"+y', { noremap = true, silent = true })
  -- paste with cmd+V for macos, but only in insert mode.
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
end

map( 'n', "<F9>", ':call vimspector#ToggleBreakpoint()<cr>', { silent = true, desc = "Toggle breakpoint" })
map( 'n', "<F8>", ':call vimspector#Reset()<cr>', { silent = true, desc = "Reset" })
map( 'n', "<F11>", ':call vimspector#StepOver()<cr>', { silent = true, desc = "Step over" })
map( 'n', "<F10>", ':call vimspector#StepOut()<cr>', { silent = true, desc = "Step out" })
map( 'n', "<F12>", ':call vimspector#StepInto()<cr>', { silent = true, desc = "Step into" })
map( 'n', "Db", ":call vimspector#ToggleBreakpoint()<cr>", { silent = true, desc = "Toggle breakpoint" })
map( 'n', "Dw", ":call vimspector#AddWatch()<cr>", { silent = true, desc = "Add watch" })
map( 'n', "De", ":call vimspector#Evaluate()<cr>", { silent = true, desc = "Evaluate" })

map( 'n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

map( 'n', '<leader>g', ':Neogit<cr>', { silent = true, desc = "Neo[g]it" })
