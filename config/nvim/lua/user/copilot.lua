local ok, copilot = prequire("copilot")
if not ok then
  return
end

if copilot then
  copilot.setup({
    cmp = {
      enabled = true,
      method = "getCompletionsCycling"
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    filetypes = {
      yaml = false,
      toml = false,
      json = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
      ["dap-repl"] = false
    },
    panel = {
      -- Disabled to not interfere with copilot-cmp
      enabled = false
    },
    suggestion = {
      -- Disabled to not interfere with copilot-cmp
      enabled = false
    },
    server_opts_overrides = {},
  })
end
