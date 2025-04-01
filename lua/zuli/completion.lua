local blink = require('blink.cmp')
blink.setup({
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    preset = 'none', -- unmap everything first
    ['<Tab>'] = {'accept', 'fallback'},
    ['<Down>'] = {'select_next', 'fallback'},
    ['<Up>'] = {'select_prev', 'fallback'},
    ['<Right>'] = {'show_documentation', 'fallback'},
    ['<Left>'] = {'cancel', 'fallback'},
  },

  appearance = {
    nerd_font_variant = 'mono' -- Adjusts spacing to ensure icons are aligned
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = { documentation = { auto_show = false } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" }
})
