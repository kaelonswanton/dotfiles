-- Replaces impatient.nvim: https://github.com/neovim/neovim/pull/22668
vim.loader.enable()
vim.api.nvim_set_var("loaded_perl_provider", 0)

require "user.utils"
require "user.options"
require "user.colorscheme"
require "user.plugins"
require "user.alpha"
require "user.autocommands"
require "user.bufferline"
require "user.barbecue"
require "user.colorizer"
require "user.commands"
require "user.copilot"
require "user.dressing"
require "user.rails"
require "user.ruby"
require "user.gitsigns"
require "user.indentline"
require "user.keymaps"
require "user.lsp"
require "user.lualine"
require "user.neo-tree"
require "user.matchup"
require "user.profiling"
require "user.snippets"
require "user.telescope"
require "user.treesitter"
require "user.whichkey"

-- Ordering dependent
require "user.cmp"

-- Personal plugins
require "plugins.gem"
