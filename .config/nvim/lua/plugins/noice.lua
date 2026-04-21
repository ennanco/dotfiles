return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      stages = "fade",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
      },
      messages = {
        enabled = true,
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
      vim.notify = require("notify")
    end,
  },
}
