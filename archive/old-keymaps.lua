
local map = vim.keymap.set


-- Mappings that are only used when run embedded in VSCode.
if vim.g.vscode then
  require("config.vscode")
else
  -- NvimChad menus.
  local general_menu = require("config.menus.menu")
  vim.keymap.set( "n", "<RightMouse>", function()
    vim.cmd.exec '"normal! \\<RightMouse>"'
    -- Which menu to open.
    local options = vim.bo.ft == "NvimTree" and "nvimtree" or general_menu
    require("menu").open(options, { mouse = true })
  end, {})
  vim.keymap.set( "v", "<RightMouse>", function()
    vim.cmd.exec '"normal! \\<RightMouse>"'
    -- Which menu to open.
    local visual_menu = require("config.menus.visual")
    require("menu").open(visual_menu, { mouse = true })
  end, {})
end


-- Registers ----------------------------------------------

-- x is same as d so it actually cuts to clipboard.
map("", "xx", "dd", { desc = "Cut" })
map({'n', 'v'}, "x", "d", { desc = "Cut" })
map("", "X", "D", { desc = "Cut end of line" })

-- d to use unnamed register so it doesn't populate clipboard.
map({""}, "d", '""d', { desc = "Delete" })
map({""}, "dd", '""dd', { desc = "Delete line" })
map({""}, "D", '""D', { desc = "Delete to end of line" })

-- Paste and indent
vim.keymap.set({ "n", "v" }, "p", "p`[v`]=`]")

-- Delete a character or insert '-' after insert character -command (plugin).
vim.keymap.set("", "-", function()
  local keys = vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() or ""
  if keys:sub(-1) == "+" then
    return "-"
  else
    return vim.api.nvim_replace_termcodes('"_x', true, true, true)
  end
end, { expr = true, desc = "Delete character" })

map({""}, "-", '"_x', { desc = "Delete character" })

-- Make different deletions not to yank

map({""}, "c", '"_c', { desc = "which_key_ignore" })
map({""}, "C", '"_C', { desc = "which_key_ignore" })

-- Easier to type registers
map({'n', 'v'}, "_", '"_', { desc = "Use _ register" })
map({'n', 'v'}, "+", '"+', { desc = "Use + register" })

map("", '<Leader>y', '"+y', { desc = "Copy to clipboard" })
map("", '<Leader>Y', '"+Y', { desc = "Copy line to clipboard" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- Misc -------------------------------------------------


map({"n"}, "<C-Up>", "<C-y>", { desc = "Scroll up" })
map({"n"}, "<C-Down>", "<C-e>", { desc = "Scroll down" })

map('n', '<Leader>sp', "<Cmd>Telescope projects<CR>", { desc = "Projects", silent = true })

-- Moving lines
map("v", "<A-Down>", "<cmd>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", "<cmd>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- In nordic keyboard easy to reach.
map("", "ö", "$", { noremap = false, silent = false, desc = "To end of line" })
vim.api.nvim_set_keymap("", "ö", "$", { noremap = false, silent = false, desc = "which_key_ignore" })
vim.api.nvim_set_keymap("n", "ä", "", { noremap = false, silent = false })

-- Windows -----------------------------------------------

-- These mappings are now used for "multiple cursors" -plugin.
map("n", "<C-M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("i", "<C-M-Up>", "<esc><cmd>m .-22<cr>", { desc = "Increase Window Width" })
map("n", "<C-M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-M-Down>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })

