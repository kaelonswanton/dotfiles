return function()
  local neotree = require("neo-tree")
  local icons = require("globals.icons")

  -- Remove deprecated commands from v1.x
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  neotree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    source_selector = {
      winbar = true,
      content_layout = "start",
      sources = {
        {
          source = "filesystem",
          display_name = " " .. icons.folders.default .. " Files "
        },
        {
          source = "buffers",
          display_name = " " .. icons.pencil .. " Buffers "
        },
        {
          source = "git_status",
          display_name = " " .. icons.git.branch .. " Git "
        },
      },
      highlight_tab = "TabLine",
      highlight_tab_active = "NeoTreeTabActive",
      highlight_background = "TabLine",
      highlight_separator = "TabLineFill",
      highlight_separator_active = "IncSearch",
      show_separator_on_edge = false,
      separator_active = false,
      tabs_layout = "focus"
    },
    default_component_configs = {
      indent = {
        padding = 0,
        indent_size = 2,
      },
      icon = {
        folder_closed = icons.folders.closed,
        folder_open = icons.folders.open,
        folder_empty = icons.folders.empty,
        default = icons.folders.default,
      },
      git_status = {
        symbols = {
          added = icons.git.added,
          deleted = icons.git.removed,
          modified = icons.git.modified,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          ignored = icons.git.ignored,
          unstaged = icons.git.unstagged,
          staged = icons.git.staged,
          conflict = icons.git.conflict,
        },
      },
    },
    window = {
      width = 30,
      mappings = {
        ["<space>"] = false,   -- disable space until we figure out which-key disabling
        o = "open",
        H = "prev_source",
        L = "next_source",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
      window = { mappings = { h = "toggle_hidden" } },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_)
          vim.opt_local.signcolumn = "auto"
        end
      },
    },
  })
end
