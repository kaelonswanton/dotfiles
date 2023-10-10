local ok, lspconfig = prequire("lspconfig")
if not ok then
  return
end

local handlers = require("user.lsp.handlers")
handlers.setup()

-- textDocument/diagnostic support until 0.10.0 is released
_timers = {}
local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      if not result then
        return
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = result.items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

local servers = {}

if lspconfig then
  servers = {
    function(server_name)
      lspconfig[server_name].setup(handlers)
    end,
    ["ruby_ls"] = function()
      lspconfig["ruby_ls"].setup({
        on_attach = function(client, bufnr)
          handlers.on_attach(client, bufnr)
          setup_diagnostics(client, bufnr)
        end,
        capabilities = handlers.capabilities
      })
    end,
    ["cssls"] = function()
      lspconfig["cssls"].setup({
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore"
            }
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore"
            }
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore"
            }
          },
        }
      })
    end,
    ["rust_analyzer"] = function()
      local _ok, rust_tools = prequire("rust-tools")
      if not _ok then
        return
      end

      if rust_tools then
        rust_tools.setup({
          server = {
            capabilities = handlers.capabilities,
            on_attach = function(client, bufnr)
              handlers.on_attach(client, bufnr)
              -- Hover actions
              vim.keymap.set(
                "n",
                "<C-space>",
                rust_tools.hover_actions.hover_actions,
                { buffer = bufnr }
              )
              -- Code action groups
              vim.keymap.set(
                "n",
                "<Leader>a",
                rust_tools.code_action_group.code_action_group,
                { buffer = bufnr }
              )
            end,
          },
        })
      end
    end,
    ["lua_ls"] = function()
      lspconfig["lua_ls"].setup({
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "it", "describe", "before_each", "after_each" }
            }
          }
        }
      })
    end
  }
end

return servers
