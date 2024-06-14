-- DOCS: Uses a 2-character search pattern to jump to a location in the file

return {
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_mappings()
    end
  }
}
