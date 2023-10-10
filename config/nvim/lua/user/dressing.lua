local ok, dressing = prequire("dressing")
if not ok then
  return
end

if dressing then
  dressing.setup({
    input = {
      default_prompt = "➤ ",
      win_options = {
        winhighlight = "Normal:Normal,NormalNC:Normal"
      },
    },
    select = {
      backend = { "telescope", "builtin" },
      builtin = {
        win_options = {
          winhighlight = "Normal:Normal,NormalNC:Normal"
        }
      },
    },
  })
end
