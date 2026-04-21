return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      ensure_installed = {
        "bashls",
        "dockerls",
        "julials",
        "omnisharp",
        "pyright",
        "taplo",
        "texlab",
        "yamlls",
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      require("mason-lspconfig").setup(opts)
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["omnisharp"] = function()
          lspconfig.omnisharp.setup({
            capabilities = capabilities,
            enable_editorconfig_support = true,
            enable_import_completion = true,
            analyze_open_documents_only = false,
          })
        end,
      })
    end,
  },
}
