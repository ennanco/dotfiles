return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      format_on_save = function(bufnr)
        return { timeout_ms = 1000, lsp_fallback = vim.bo[bufnr].filetype ~= "c_sharp" }
      end,
      formatters_by_ft = {
        bash = { "shfmt" },
        dockerfile = { "shfmt" },
        julia = { "juliafmt" },
        markdown = { "prettier" },
        python = { "black" },
        tex = { "latexindent" },
        toml = { "taplo" },
        yaml = { "prettier" },
      },
      formatters = {
        juliafmt = {
          command = "julia",
          args = { "-e", "using JuliaFormatter; format_text(stdin)" },
          stdin = true,
        },
      },
    },
  },
}
