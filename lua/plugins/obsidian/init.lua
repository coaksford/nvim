return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre " .. os.getenv("HOME") .. "/Notes/*.md",
    "BufNewFile " .. os.getenv("HOME") .. "/Notes/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "~/Notes",
      },
    },

    -- Completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 3,
    },
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      
      -- for nvim 0.10+
      if vim.version().major > 0 or vim.version().minor >= 10 then
        vim.ui.open(url)
      else
        if vim.uv.os_uname().sysname == "Darwin" then
          vim.fn.jobstart({"open", url})
        end
        if vim.uv.os_uname().sysname == "Linux" then
          vim.fn.jobstart({"xdg-open", url})
        end
      end
    end
  },
}
