return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c_sharp",
        "dockerfile",
        "julia",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "toml",
        "vim",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
