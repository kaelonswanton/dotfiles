return {
  {
    "vim-test/vim-test",
    init = function()
      local function shell(cmd)
        local h = io.popen(cmd)
        local out = h:read("*a")
        h:close()
        return out:gsub("%s+$", "")
      end

      local function sh_quote(s)
        return "'" .. tostring(s):gsub("'", "'\\''") .. "'"
      end

      -- Pick tmux or tmate depending on context
      local TMUX_BIN = os.getenv("TMATE") and "tmate" or "tmux"

      vim.g["test#tmux_preserve_scroll"] = true

      vim.g["test#custom_strategies"] = {
        tmux = function(cmd)
          local pane_var = "vim_test_pane"
          local pane_id = vim.g[pane_var]

          -- Create the pane if missing
          if not pane_id or pane_id == "" then
            pane_id = shell(TMUX_BIN .. " split-window -P -F '#{pane_id}' -v -l 12")
            vim.g[pane_var] = pane_id
          else
            local exists = os.execute(TMUX_BIN .. " list-panes -F '#{pane_id}' | grep -q " .. pane_id)
            if exists ~= 0 then
              vim.g[pane_var] = nil
              return vim.g["test#custom_strategies"].tmux(cmd)
            end
          end

          -- Check copy-mode (older tmate might not have #{pane_in_mode})
          local in_mode = shell(TMUX_BIN .. " display-message -p -t " .. pane_id .. " '#{pane_in_mode}' 2>/dev/null")

          if in_mode == "1" and vim.g["test#tmux_preserve_scroll"] then
            local tmp_pane = shell(TMUX_BIN .. " split-window -P -F '#{pane_id}' -v -l 12")
            local cmd_chain = string.format(
              "%s send-keys -t %s C-l \\; %s send-keys -t %s -l %s C-m",
              TMUX_BIN, tmp_pane, TMUX_BIN, tmp_pane, sh_quote(cmd)
            )
            vim.fn.jobstart({ "sh", "-c", cmd_chain })
            return
          end

          local tmux_chain = string.format(
            "%s send-keys -t %s -X cancel \\; %s send-keys -t %s C-l \\; %s send-keys -t %s -l %s C-m",
            TMUX_BIN, pane_id, TMUX_BIN, pane_id, TMUX_BIN, pane_id, sh_quote(cmd)
          )
          vim.fn.jobstart({ "sh", "-c", tmux_chain })
        end,
      }
    end,
    keys = {
      {
        "<leader>t",
        mode = { "n", "v" },
        desc = "[t]est file",
        function()
          vim.cmd("TestFile")
        end,
      },
      {
        "<leader>a",
        mode = { "n", "v" },
        desc = "Test suite",
        function()
          vim.cmd("TestSuite spec packages")
        end,
      },
      {
        "<leader>A",
        mode = { "n", "v" },
        desc = "Test suite",
        function()
          vim.cmd("TestSuite spec packages --only-failures")
        end,
      },
      {
        "<leader>s",
        mode = { "n", "v" },
        desc = "Test [s]ingle",
        function()
          vim.cmd("TestNearest")
        end,
      },
      {
        "<A-t>",
        mode = { "n", "v" },
        desc = "[o]utput",
        function()
          vim.cmd("TestOutput")
        end,
      },
    },
  },
}
