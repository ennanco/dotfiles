return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            reveal = true,
            dir = vim.uv.cwd(),
          })
        end,
        desc = "Explorer (Neo-tree)",
      },
      {
        "_e",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            reveal = true,
            dir = vim.uv.cwd(),
          })
        end,
        desc = "Explorer (Neo-tree)",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },
  {
    "echasnovski/mini.files",
    version = false,
    keys = {
      {
        "<leader>fm",
        function()
          local path = vim.api.nvim_buf_get_name(0)
          if path == "" then
            path = vim.uv.cwd()
          end
          require("mini.files").open(path, true)
        end,
        desc = "Mini files",
      },
    },
    opts = {},
  },
}
