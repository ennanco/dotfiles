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
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_blink, blink = pcall(require, "blink.cmp")
      if has_blink then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      require("mason-lspconfig").setup(opts)

      for _, server_name in ipairs(opts.ensure_installed or {}) do
        if server_name ~= "omnisharp" and lspconfig[server_name] then
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end
      end

      if lspconfig.omnisharp then
        lspconfig.omnisharp.setup({
          capabilities = capabilities,
          enable_editorconfig_support = true,
          enable_import_completion = true,
          analyze_open_documents_only = false,
        })
      end
    end,
  },
}
