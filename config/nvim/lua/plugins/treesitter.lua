return function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    autotag = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    },
    ensure_installed = {
      "css",
      "elixir",
      "embedded_template",   -- ERB support
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
      "yaml",
    },
    highlight = {
      enable = true,   -- false will disable the whole extension
      additional_vim_regex_highlighting = true,
      use_language_tree = true,
    },
    indent = {
      enable = true,
      disable = { "ruby" }
    },
    matchup = {
      enable = true
    },
    -- playground = {
    --   enable = true,
    --   disable = {},
    --   updatetime = 25,           -- Debounced time for highlighting nodes in the playground from source code
    --   persist_queries = false,   -- Whether the query persists across vim sessions
    --   keybindings = {
    --     toggle_query_editor = 'o',
    --     toggle_hl_groups = 'i',
    --     toggle_injected_languages = 't',
    --     toggle_anonymous_nodes = 'a',
    --     toggle_language_display = 'I',
    --     focus_language = 'f',
    --     unfocus_language = 'F',
    --     update = 'R',
    --     goto_node = '<cr>',
    --     show_help = '?',
    --   },
    -- }
  })
end
