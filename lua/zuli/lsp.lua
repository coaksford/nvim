
-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
local wk = require('which-key')
wk.add({
  {'<leader>c', group = '[C]ode' },
  {'<leader>d', group = '[D]ocument' },
  {'<leader>g', group = '[G]it' },
  {'<leader>h', group = 'More git' },
  {'<leader>r', group = '[R]ename' },
  {'<leader>s', group = '[S]earch' },
  {'<leader>w', group = '[W]orkspace' },
})

-- LSP
require('mason').setup()
require('mason-lspconfig').setup()

-- Ignore rust analyzer complaints
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

local servers = {
  clangd = {},
  gopls = {},
  pyright = {}, -- requires nodejs
  rust_analyzer = {
    checkOnSave = {
      enable = false,
    }
  },
  -- tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} }, --requires nodejs

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim" }
      },
    },
  },
}

-- add blink's capabilites to the default nvim capabilities when telling an LSP what we can handle
local capabilities = require('blink.cmp').get_lsp_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

require('neodev').setup()

local rt = require("rust-tools")

local tools = {}
tools.inlay_hints = {}

if vim.g.neovide then
  tools.inlay_hints.only_current_line = true
else
  tools.inlay_hints.auto = true
end

rt.setup({
  tools = tools,
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = '?'})
sign({name = 'DiagnosticSignInfo', text = 'i'})
-- 
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Check whether this is a nix environment or not, either NixOS, or a nix-shell, nix develop shell,
-- or something else similar enough to it that we need to not rely on system lsps and rely on nix
-- store LSPs.
function is_nix()
  -- check if we're in a nix shell
  if os.getenv("NIX_STORE") ~= "" then
    return true
  end

  -- if not in a nix shell, and also not linux, it's not nixos
  if vim.uv.os_uname().sysname ~= "Linux" then
    return false
  end

  -- if it is linux, then check if the os release is nixos
  local os_release_fd = assert(io.open("/etc/os-release"), "r")
  local os_release = os_release_fd:read("*a")
  os_release_fd:close()
  local nixos = string.find(os_release, "nixos") ~= nil
  return nixos
end

-- This may no longer be needed as of neovim 0.11+ and instead causes multiple LSPs to run at once.
if is_nix() and false then
  require('lspconfig').rust_analyzer.setup{
    cmd = {os.getenv("HOME") .. "/.nix-profile/bin/rust-analyzer"},
  }

  require('lspconfig').lua_ls.setup{
    cmd = {os.getenv("HOME") .. "/.nix-profile/bin/lua-language-server"},
  }

  require('lspconfig').clangd.setup{
    cmd = {os.getenv("HOME") .. "/.nix-profile/bin/clangd"},
  }

  require('lspconfig').gopls.setup{
    cmd = {os.getenv("HOME") .. "/.nix-profile/bin/gopls"},
  }

  require('lspconfig').hls.setup{
    cmd = {os.getenv("HOME") .. "/.nix-profile/bin/haskell-language-server-wrapper"},
  }
end

-- Enable inlays by default
if vim.lsp.inlay_hint then
  vim.lsp.inlay_hint.enable(true)
end

require('treesitter-context').setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = false, -- Enable multiwindow support.
  max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 10, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
