-- which LSPs to install
local lsps = { "clangd", "rust_analyzer", "gopls", "pyright", "html", "lua_ls" }
for lsp in vim.iter(lsps) do
  vim.lsp.enable(lsp)
end

-- language-specific configuration
vim.lsp.config("rust_analyzer", {
  checkOnSave = {
    enable = false,
  }
})
vim.lsp.config("html", { filetypes = { 'html', 'twig', 'hbs'} })
vim.lsp.config("lua_ls", {
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
    diagnostics = {
      globals = { "vim" }
    },
  },
})

-- package manager for LSPs and DAP adapters
require('mason').setup()

-- ignore rust analyzer complaints
if false then
  for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
      if err ~= nil and err.code == -32802 then
        return
      end
      return default_diagnostic_handler(err, result, context, config)
    end
  end
end

-- add blink's capabilites to the default nvim capabilities when telling an LSP what we can handle
local capabilities = require('blink.cmp').get_lsp_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '?',
      [vim.diagnostic.severity.INFO] = 'i',
    },
  },
  virtual_text = false,
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
local function is_nix()
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
if is_nix() and vim.version().major == 0 and vim.version().minor < 11 then
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

-- enable inlays by default
if vim.lsp.inlay_hint then
  vim.lsp.inlay_hint.enable(true)
end

-- when scrolled down far enough that parent scopes are hidden, display parent lines to help keep
-- oriented
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
