return {
  {
    "startup-nvim/startup.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("startup").setup(require("zuli.startup-theme"))
    end
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        manual_mode = false,
        exclude_dirs = { "~/.cargo/*", },
        detection_methods = { "lsp", "pattern" },
        silent_chdir = true,
        scope_chdir = 'global',
      }
    end
  },
}
