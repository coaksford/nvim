return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  { "hrsh7th/cmp-buffer", },
  -- { "hrsh7th/cmp-nvim-lsp", },
  { "hrsh7th/cmp-nvim-lsp-signature-help", },
  { "hrsh7th/cmp-nvim-lua", },
  { "hrsh7th/cmp-path", },
  { "hrsh7th/cmp-vsnip", },
  -- { "hrsh7th/nvim-cmp", },
  { "hrsh7th/vim-vsnip", },
}
