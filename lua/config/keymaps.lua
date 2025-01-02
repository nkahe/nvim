-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Mappings that are only used when run embedded in VSCode.
if vim.g.vscode then
  require("config.vscode")
else
  -- local general_menu = require("config.menus.menu")
  -- vim.keymap.set( "n", "<RightMouse>", function()
  --   vim.cmd.exec '"normal! \\<RightMouse>"'
  --   -- Which menu to open.
  --   local options = vim.bo.ft == "NvimTree" and "nvimtree" or general_menu
  --   require("menu").open(options, { mouse = true })
  -- end, {})
  -- vim.keymap.set( "v", "<RightMouse>", function()
  --   vim.cmd.exec '"normal! \\<RightMouse>"'
  --   -- Which menu to open.
  --   local visual_menu = require("config.menus.visual")
  --   require("menu").open(visual_menu, { mouse = true })
  -- end, {})
end

require("config.user-commands")

-- NOTE: For mappings "{ noremap = true }" is the default so no need to add that.

-- Registers ----------------------------------------------

-- x is same as d so it actually cuts to clipboard.
-- map("", "xx", "dd", { desc = "Cut" })
-- map({'n', 'v'}, "x", "d", { desc = "Cut" })
-- map("", "X", "D", { desc = "Cut end of line" })

-- d to use unnamed register so it doesn't populate clipboard.
-- map({""}, "d", '""d', { desc = "Delete" })
-- map({""}, "dd", '""dd', { desc = "Delete line" })
-- map({""}, "D", '""D', { desc = "Delete to end of line" })

-- Paste and indent
-- vim.keymap.set({ "n", "v" }, "p", "p`[v`]=`]")

-- Delete a character or insert '-' after insert character -command (plugin).
-- vim.keymap.set("", "-", function()
--   local keys = vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() or ""
--   if keys:sub(-1) == "+" then
--     return "-"
--   else
--     return vim.api.nvim_replace_termcodes('"_x', true, true, true)
--   end
-- end, { expr = true, desc = "Delete character" })

-- map({""}, "-", '"_x', { desc = "Delete character" })

-- Make different deletions not to yank

-- map({""}, "c", '"_c', { desc = "which_key_ignore" })
-- map({""}, "C", '"_C', { desc = "which_key_ignore" })
-- Deleting without yanking

map({'n', 'v'}, "<Leader>d", '"_d', { desc = "Delete without yanking" })
map({'n', 'v'}, "<Leader>D", '"_D', { desc = "Delete to end of line without yanking" })
map({'n', 'v'}, "<LocalLeader>d", '"_d', { desc = "Delete without yanking" })
map({'n', 'v'}, "<LocalLeader>D", '"_D', { desc = "Delete to end of line without yanking" })
map({'n', 'v'}, "<A-d>", '"_d', { desc = "Delete without yanking" })
map({'n', 'v'}, "<A-D>", '"_D', { desc = "Delete to end of line without yanking" })
-- AltGr + d in nordic layout
map({'n', 'v'}, "ð", '"_d', { desc = "Delete without yanking" })
map({'n', 'v'}, "Ð", '"_d', { desc = "Delete to end of line without yanking" })
-- map("x", "<Leader>p", '"_dP', { desc = "Paste" })

map({'n', 'v'}, "<Del>", '"_x', { desc = "which_key_ignore" })
map({'n', 'v'}, "<BS>", '"_X', { desc = "which_key_ignore" })
map({'n', 'v'}, "x", '"_x', { desc = "which_key_ignore" })
map({'n', 'v'}, "X", '"_X', { desc = "which_key_ignore" })

-- Clipboard operators
map({'n', 'v'}, "cp", '"+p',  { desc = "Paste from clipboard" })
map({'n', 'v'}, "cP", '"+P',  { desc = "Paste from clipboard" })
map({'n', 'v'}, "cd", '"+d',  { desc = "Delete to clipboard" })
map({'n', 'v'}, "cD", '"+D',  { desc = "Delete end of line to clipboard" })
map({'n', 'v'}, "cy", '"+y',  { desc = "Yank to clipboard" })
map({'n', 'v'}, "cY", '"+Y',  { desc = "Yank end of line to clipboard" })

-- Easier to type registers
map({'n', 'v'}, "_", '"_', { desc = "Use _ register" })
map({'n', 'v'}, "+", '"+', { desc = "Use + register" })

-- map("", '<Leader>y', '"+y', { desc = "Copy to clipboard" })
-- map("", '<Leader>Y', '"+Y', { desc = "Copy line to clipboard" })

-- vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- GUI style insert mappings
map({'n', 'v'}, '<S-Insert>', '"*P', { desc = "Paste selection" })
map('i', '<S-Insert>', '<C-o>"*P')
map('t', '<S-Insert>', '<C-\\><C-n>"*Pi')
map('c', '<S-Insert>', '<C-R>*')

map('x', '<C-Insert>', '"+y')

-- For GUI only is in section at end part of file.

-- Adding lines --------------------------------------------

-- <Leader>o/O rivin aloitus ilman continuatiota?

local function add_blank_line(direction)
  local repeated = vim.fn["repeat"]({ "" }, vim.v.count1)
  local line = vim.api.nvim_win_get_cursor(0)[1]
  if direction == "above" then
    line = line - 1
  elseif direction == "below" then
  else
    error("Invalid direction: " .. tostring(direction))
  end
  vim.api.nvim_buf_set_lines(0, line, line, true, repeated)
end

-- Expose the function globally for operatorfunc
_G.add_blank_line_above = function() add_blank_line("above") end
_G.add_blank_line_below = function() add_blank_line("below") end

vim.keymap.set('n', '[<Space>', function()
  vim.go.operatorfunc = "v:lua.add_blank_line_above"
  return 'g@l'
end, { desc = "Add empty line above", expr = true, silent = true })

vim.keymap.set('n', ']<Space>', function()
  vim.go.operatorfunc = "v:lua.add_blank_line_below"
  return 'g@l'
end, { desc = "Add empty line below", expr = true, silent = true })

-- Misc ---------------------------------------------------

-- Focus previous / next buffer
map({"n", "i"}, "<M-Right>", "<cmd>bnext<CR>", { silent = true })
map({"n", "i"}, "<M-Left>", "<cmd>bprevious<CR>", { silent = true })

-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- In nordic keyboard easy to reach.
-- map("", "ö", "$", { noremap = false, silent = false, desc = "To end of line" })
-- vim.api.nvim_set_keymap("", "ö", "$", { noremap = false, silent = false, desc = "which_key_ignore" })
-- vim.api.nvim_set_keymap("n", "ä", "", { noremap = false, silent = false })

-- map('n', '<Leader>gl', function() Snacks.lazygit() end, { desc = "LazyGit", silent = false })

-- Search word under cursor and change it. n to go next and . to repeat.
vim.keymap.set("n", "c*", "g*Ncgn", { noremap = true })

-- Help pages: <CR> to open links in addition to C-]
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man" },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<C-]>", { silent = true })
  end,
})

-- Restore some default mappings ------------------------------

vim.keymap.set({'n', 'v'}, '<up>', '<nop>', { desc = "Disable arrow key" })
vim.keymap.set({'n', 'v'}, '<down>', '<nop>', { desc = "Disable arrow key" })
vim.keymap.set({'n', 'v'}, '<left>', '<nop>', { desc = "Disable arrow key" })
vim.keymap.set({'n', 'v'}, '<right>', '<nop>', { desc = "Disable arrow key" })

vim.schedule(function()
  -- Check if the mappings exist before deleting them
  if vim.fn.maparg("H", "n") ~= "" then
    vim.keymap.del("n", "H")
  end
  if vim.fn.maparg("L", "n") ~= "" then
    vim.keymap.del("n", "L")
  end
end)

--------------------------------------------------------------------------------
-- No VSCode mappings after this
--------------------------------------------------------------------------------

if vim.g.vscode then
  return
end

-- Alt mappings can sometimes trigger with <esc> when using in terminal.

-- Moving lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- map("v", "<A-Down>", "<cmd>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-Up>", "<cmd>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Move down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Move up" })


map("n", "<M-l>", "<cmd>bnext<CR>", { silent = true })
map("n", "<M-h>", "<cmd>bprevious<CR>", { silent = true })

-- Add common shortcuts from GUI apps.
map("i", '<C-BS>', '<C-w>', { silent = true })
map("i", '<C-Del>', '<C-o>dw', { silent = true })

-- map({"n"}, "<C-Up>", "<C-y>", { desc = "Scroll up" })
-- map({"n"}, "<C-Down>", "<C-e>", { desc = "Scroll down" })

-- map('n', '<Leader>sp', "<Cmd>Telescope projects<CR>", { desc = "Projects", silent = true })

map('n', "<LocalLeader>r", "<cmd>Neotree reveal_force_cwd<CR>", { desc = "Reveal in Neotree" })


-- Function to capture keypress and show its mapping
function capture_keypress()
  -- Wait for the next key press
  local key = vim.fn.getchar()

  -- Convert the key to a string representation
  local key_str = vim.fn.nr2char(key)

  -- Show what the key does
  vim.cmd('verbose map ' .. key_str)
end

-- Create a key mapping tuhat calls the function
vim.api.nvim_set_keymap('n', '<leader>k', ':lua capture_keypress()<CR>',
  { desc = "Show what mapping does", noremap = true, silent = true })

-- Terminal ------------------------------------------------

map("n", "<Leader>tb", "<CMD>terminal<CR>", { desc = "Open in new buffer" })

map("n", "<Leader>tt", "<CMD>lua Snacks.terminal.toggle()<CR>", { desc = "Toggle terminal" })

vim.keymap.set("n", "<leader>tf", function()
  -- A command needs specified to open in float.
  local shell = vim.o.shell
  require("snacks.terminal").open(shell, {})
end, { desc = "Floating terminal" })

-- Not all terminals support this.
map("n", "<C-`>", "<CMD>lua Snacks.terminal.toggle()<CR>", { silent = true})
map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "q", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- "q" also quits terminal window in normal mode.

-- map("n", "<C-Space>", "<CMD>lua Snacks.terminal.toggle()<CR>", { silent = true})
-- map("t", "<C-`>", "<C-\\><C-n><CMD>lua toggle_terminal()<CR>", { silent = true })

-- Tap C-\ twice to exit terminal mode
map('t', [[<C-\><C-\>]], [[<C-\><C-n>]], { silent = true })

vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
end, { desc = "◨ Open in vertical split" })


-- Windows -----------------------------------------------

-- Used for multiple cursors.
-- map("n", "<C-M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
-- map("i", "<C-M-Up>", "<esc><cmd>m .-22<cr>", { desc = "Increase Window Width" })
-- map("n", "<C-M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- map("n", "<C-M-Down>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })


-- GUI --------------------------------------------------

if vim.g.neovide then
  -- Clipboard commands similar to terminals.

  -- Paste main clipboard
  map({'n', 'v'}, '<C-S-v>', '"+P', { desc = "Paste from clipboard" })
  map('i', '<C-S-v>', '<C-o>"+P')
  map('t', '<C-S-v>', '<C-\\><C-n>"+Pi')
  vim.keymap.set('c', '<C-S-v>', '<C-R>+')

  -- Copy
  map('v', '<C-S-c>', '"+y')
end

-- Whichkey descriptions

-- local wk = require("which-key")
-- wk.add({
--   { "[[", desc = "Previous reference" },
--   { "]]", desc = "Next reference" },
-- }, { mode = "n" })

-- Minor tweaks ------------------------------------------

-- Accidentally press on Shift+{arrow} to just move cursor in Visual mode
map("x", "<S-Down>", "j")
map("x", "<S-Up>", "k")
map("x", "<S-Right>", "l")
map("x", "<S-Left>", "h")

