-- DOCS: Sets up treesitter which provides better syntax highlighting and
-- information about text objects to other plugins.

return function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    auto_install = false,
    ignore_install = {
      "help",
    },
    ensure_installed = {
      "css",
      "elixir",
      "embedded_template", -- ERB support
      "gitignore",
      "gitcommit",
      "gitattributes",
      "git_rebase",
      "heex",
      "html",
      "json",
      "javascript",
      "lua",
      "python",
      "ruby",
      "rust",
      "sql",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    matchup = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      additional_vim_regex_highlighting = true,
      use_language_tree = true,
    },
    indent = {
      -- Disable treesitter's indentation for nvim's builtin smartindent
      -- which can be much faster at the cost of slightly less accuracy
      enable = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = false,
      },
    },
  })
end
