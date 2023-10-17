-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "simrat39/rust-tools.nvim",
  },
  {
    "hrsh7th/cmp-buffer",
  },{
    "hrsh7th/cmp-nvim-lsp",
  },{
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },{
    "hrsh7th/cmp-nvim-lua",
  },{
    "hrsh7th/cmp-path",
  },{
    "hrsh7th/cmp-vsnip",
  },{
    "hrsh7th/nvim-cmp",
  },{
    "hrsh7th/vim-vsnip",
  },{
    "ThePrimeagen/vim-be-good"
  },
}

