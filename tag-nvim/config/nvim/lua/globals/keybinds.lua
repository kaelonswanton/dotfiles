-- DOCS: This is our main file to set our always on keybinds.
-- Used by core/keymaps.lua to set keybinds
-- Used by whichkey to show keybinds on popup

-- NOTE: These are the modes of commands
-- - normal_mode = "n",
-- - insert_mode = "i",
-- - visual_mode = "v",
-- - visual_block_mode = "x",
-- - term_mode = "t",
-- - command_mode = "c",

return {
  {
    mode = "n",
    key = "<Leader>a",
    command = "<cmd>%s/>\\s*</>\\r</g<CR>",
  },
  {
    mode = "n",
    key = "<Leader>w",
    command = "<cmd>w<CR>",
    description = "Save file",
  },
  {
    mode = "v",
    key = "y",
    command = "ygv<Esc>",
    description = "Yank visual selection and keep cursor at the end",
  },
  {
    mode = "n",
    key = "<C-c>",
    command = "ciw",
    description = "Remove word and go to insert mode",
  },
  {
    mode = { "i", "x" },
    key = "<C-s>",
    command = "<Esc><cmd>silent! update | redraw<CR>",
    description = "Save file and go to normal mode",
  },
  {
    mode = "n",
    key = "<C-s>",
    command = "<cmd>silent! update | redraw<CR>",
    description = "Save file",
  },
  {
    mode = "n",
    key = "<Leader><Leader>",
    command = "<C-^>",
    description = "Switch between the last two files",
  },
  {
    mode = "n",
    key = "<C-h>",
    command = "<C-w>h",
    description = "Better window navigation (left)",
  },
  {
    mode = "n",
    key = "<C-j>",
    command = "<C-w>j",
    description = "Better window navigation (down)",
  },
  {
    mode = "n",
    key = "<C-k>",
    command = "<C-w>k",
    description = "Better window navigation (up)",
  },
  {
    mode = "n",
    key = "<C-l>",
    command = "<C-w>l",
    description = "Better window navigation (right)",
  },
  {
    mode = "n",
    key = "<M-Up>",
    command = ":resize -2<CR>",
    description = "Resize window height (-2)",
  },
  {
    mode = "n",
    key = "<M-Down>",
    command = ":resize +2<CR>",
    description = "Resize window height (+2)",
  },
  {
    mode = "n",
    key = "<M-Left>",
    command = ":vertical resize +2<CR>",
    description = "Resize window width (+2)",
  },
  {
    mode = "n",
    key = "<M-Right>",
    command = ":vertical resize -2<CR>",
    description = "Resize window width (-2)",
  },
  {
    mode = "n",
    key = "<S-l>",
    command = ":bnext<CR>",
    description = "Navigate to next buffer",
  },
  {
    mode = "n",
    key = "<S-h>",
    command = ":bprevious<CR>",
    description = "Navigate to previous buffer",
  },
  {
    mode = "n",
    key = "<A-j>",
    command = "<Esc>:m .+1<CR>==gi",
    description = "Move text down",
  },
  {
    mode = "n",
    key = "<A-k>",
    command = "<Esc>:m .-2<CR>==gi",
    description = "Move text up",
  },
  {
    mode = "v",
    key = "<",
    command = "<gv",
    description = "Stay in indent mode (shift left)",
  },
  {
    mode = "v",
    key = ">",
    command = ">gv",
    description = "Stay in indent mode (shift right)",
  },
  {
    mode = "v",
    key = "<A-j>",
    command = ":m .+1<CR>==",
    description = "Move text down (visual)",
  },
  {
    mode = "v",
    key = "<A-k>",
    command = ":m .-2<CR>==",
    description = "Move text up (visual)",
  },
  {
    mode = "x",
    key = "J",
    command = ":move '>+1<CR>gv-gv",
    description = "Move visual block down",
  },
  {
    mode = "x",
    key = "K",
    command = ":move '<-2<CR>gv-gv",
    description = "Move visual block up",
  },
  {
    mode = "n",
    key = "<Leader>=",
    command = "<cmd>vertical resize +10<CR>",
    description = "Increase window width by 10",
  },
  {
    mode = "n",
    key = "<Leader>-",
    command = "<cmd>vertical resize -10<CR>",
    description = "Decrease window width by 10",
  },
}
