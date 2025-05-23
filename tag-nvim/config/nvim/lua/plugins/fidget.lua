-- DOCS: Loading status for LSP and other plugins that do work in the background

local icons = require("globals.icons")
local utils = require("core.utils")

return {
  {
    -- LSP loading popup on bottom right
    "j-hui/fidget.nvim",
    event = "LspAttach",
    tag = "legacy",
    opts = {
      display = {
        render_limit = 5,
        done_ttl = 2,
        done_icon = icons.check, -- character shown when all tasks are complete
      },
      text = {
        spinner = "dots_snake", -- animation shown when tasks are ongoing
        done = icons.check, -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
      },
      align = {
        bottom = true, -- align fidgets along bottom edge of buffer
        right = true, -- align fidgets along right edge of buffer
      },
      timer = {
        spinner_rate = 125, -- frame rate of spinner animation, in ms
        fidget_decay = 2000, -- how long to keep around empty fidget, in ms
        task_decay = 1000, -- how long to keep around completed task, in ms
      },
      window = {
        relative = "win",
        blend = 0, -- catppuccin integration
        zindex = nil,
        border = utils.border("FloatBorder"), -- style of border for fidget window
      },
      fmt = {
        leftpad = true, -- right-justify text in fidget box
        stack_upwards = true, -- list of tasks grows upwards
        max_messages = 3, -- The maximum number of messages stacked at any give time
        max_width = 0, -- maximum width of the fidget box
        -- function to format fidget title
        fidget = function(fidget_name, spinner)
          return string.format("%s %s", spinner, fidget_name)
        end,
        -- function to format each task line
        task = function(task_name, message, percentage)
          return string.format(
            "%s%s [%s]",
            message,
            percentage and string.format(" (%s%%)", percentage) or "",
            task_name
          )
        end,
      },
      debug = {
        logging = false, -- whether to enable logging, for debugging
        strict = false, -- whether to interpret LSP strictly
      },
    },
  },
}
