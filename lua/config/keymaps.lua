-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Mappings that are only used when run embedded in VSCode.
if vim.g.vscode then
  require("config.vscode")
end

-- NOTE: For mappings "{ noremap = true }" is the default so no need to add that.

-- Registers ----------------------------------------------

-- x is same as d so it actually cuts to clipboard.
-- map("", "xx", "dd", { desc = "Cut" })
-- map('', "x", "d", { desc = "Cut" })
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
map('', "<Leader>d", '"_d', { desc = "Delete without yanking" })
map('', "<Leader>D", '"_D', { desc = "Delete to end of line without yanking" })
map('', "<A-d>", '"_d', { desc = "Delete without yanking" })
map('', "<A-D>", '"_D', { desc = "Delete to end of line without yanking" })
-- AltGr + d in nordic layout
map('', "ð", '"_d', { desc = "Delete without yanking" })
map('', "Ð", '"_d', { desc = "Delete to end of line without yanking" })
-- map("x", "<Leader>p", '"_dP', { desc = "Paste" })

map({""}, "<Del>", '"_x', { desc = "which_key_ignore" })
map("n", '<BS>', '"_X', { desc = "which_key_ignore" })
map({""}, "x", '"_x', { desc = "which_key_ignore" })
map({""}, "X", '"_X', { desc = "which_key_ignore" })

-- Clipboard operators
map('', "cp", '"+p',  { desc = "Paste from clipboard" })
map('', "cP", '"+P',  { desc = "Paste from clipboard" })
map('v', "cp", '"+p', { desc = "Paste from clipboard" })
map('v', "cP", '"+P', { desc = "Paste from clipboard" })
map('', "cd", '"+d',  { desc = "Delete to clipboard" })
map('', "cD", '"+D',  { desc = "Delete end of line to clipboard" })
map('v', "cd", '"+d', { desc = "Delete to clipboard" })
map('', "cy", '"+y',  { desc = "Yank to clipboard" })
map('', "cY", '"+Y',  { desc = "Yank end of line to clipboard" })
map('v', "cy", '"+y', { desc = "Yank to clipboard" })

-- Easier to type registers
map('', "_", '"_', { desc = "Use _ register" })
map({""}, "+", '"+', { desc = "Use + register" })

-- map("", '<Leader>y', '"+y', { desc = "Copy to clipboard" })
-- map("", '<Leader>Y', '"+Y', { desc = "Copy line to clipboard" })

-- vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- GUI style insert mappings
map('', '<S-Insert>', '"*P', { desc = "Paste selection" })
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

-- Help pages: <CR> to open links in addition to ^]
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<C-]>", { silent = true })
  end,
})

-- Command mode (:) -----------------------------------------

vim.keymap.set("ca", "W", "w")
vim.keymap.set("ca", "Wq", "wq")
vim.keymap.set("ca", "WQ", "wq")

local create_cmd = vim.api.nvim_create_user_command

create_cmd('Cdb', function()
  vim.cmd('cd ' .. vim.fn.expand('%:p:h'))
  vim.cmd('pwd')
end, { desc = "Change cwd to match current buffer's directory" })

-- Obsidian plugin
create_cmd('Obs', function()
  vim.cmd('cd ~/Documents/notes')
  vim.cmd("vnew")
  -- vim.cmd("vertical resize 30")
  -- Go back to the original window
  vim.cmd("wincmd h")
  vim.cmd('Neotree show')
  vim.cmd('sleep 100ms')
  -- vim.cmd("vertical resize 80")
  vim.cmd("vertical resize 90")
  -- Resize the new split to 80 columns
  -- vim.cmd("edit '~/Documents/notes/1 Projektit/1 Todo.md'")
end, { desc = "Change to Obsidian notes directory" })

-- Trim trailing whitespace from the buffer
create_cmd('Trim', function()
  local save_cursor = vim.fn.getpos(".")
  -- Save view state for visual mode users
  local save_view = vim.fn.winsaveview()
  -- Perform the substitution to trim trailing whitespace
  vim.cmd([[keeppatterns %s/\v\s+$//e]])
  -- Restore cursor position and view state
  vim.fn.setpos(".", save_cursor)
  vim.fn.winrestview(save_view)
end, { desc = "Trim trailing whitespace from the buffer" })

-- Source keymaps.lua and options.lua, and show a notification
create_cmd("Reload", function()
  local success_keymaps, success_options, success_autocmds  = false, false, false
  local basepath = vim.fn.stdpath("config") .. "/lua/config"

  local keymaps_path = basepath .. "/keymaps.lua"
  success_keymaps = pcall(dofile, keymaps_path)

  local options_path = basepath .. "/options.lua"
  success_options = pcall(dofile, options_path)

  local autocmds_path = basepath .. "/autocmds.lua"
  success_autocmds = pcall(dofile, autocmds_path)

  -- Check results and display a message
  if success_keymaps and success_options and success_autocmds then
    vim.notify("Sourced keymaps.lua, options.lua, autocmds.lua", vim.log.levels.INFO)
  elseif not success_keymaps then
    vim.notify("Failed to source keymaps.lua", vim.log.levels.ERROR)
  elseif not success_options then
    vim.notify("Failed to source options.lua", vim.log.levels.ERROR)
  elseif not success_autocmds then
    vim.notify("Failed to source autocmds.lua", vim.log.levels.ERROR)
  end
end, { desc = "Reload settings" })

-- Restore default mappings ------------------------------

vim.schedule(function()
  -- Check if the mappings exist before deleting them
  if vim.fn.maparg("H", "n") ~= "" then
    vim.keymap.del("n", "H")
  end
  if vim.fn.maparg("L", "n") ~= "" then
    vim.keymap.del("n", "L")
  end
end)

-- No VSCode mappings after this ===========================

if vim.g.vscode then
  return
end

-- Alt mappings can sometimes trigger with <esc> when using in terminal.

-- Moving lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", "<cmd><C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", "<cmd><C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

map("n", "<M-l>", "<cmd>bnext<CR>", { silent = true })
map("n", "<M-h>", "<cmd>bprevious<CR>", { silent = true })

-- Add common shortcuts from GUI apps.
map("i", '<C-BS>', '<C-w>', { silent = true })
map("i", '<C-Del>', '<C-o>dw', { silent = true })

map({"n"}, "<C-Up>", "<C-y>", { desc = "Scroll up" })
map({"n"}, "<C-Down>", "<C-e>", { desc = "Scroll down" })

map('n', '<Leader>sp', "<Cmd>Telescope projects<CR>", { desc = "Projects", silent = true })


map('n', "<LocalLeader>r", "<cmd>Neotree reveal_force_cwd<CR>", { desc = "Reveal in Neotree" })

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

map("n", "<C-M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("i", "<C-A-Up>", "<esc><cmd>m .-22<cr>", { desc = "Increase Window Width" })
map("n", "<C-M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-M-Down>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })


-- GUI --------------------------------------------------

if vim.g.neovide then
  -- Clipboard commands similar to terminals.

  -- paste main
  map('', '<C-S-v>', '"+P', { desc = "Paste from clipboard" })
  map('i', '<C-S-v>', '<C-o>"+P')
  map('t', '<C-S-v>', '<C-\\><C-n>"+Pi')
  vim.keymap.set('c', '<C-S-v>', '<C-R>+')

  -- Copy
  map('v', '<C-S-c>', '"+y')
end


-- Minor tweaks ------------------------------------------

-- Accidentally press on Shift+{arrow} to just move cursor in Visual mode
map("x", "<S-Down>", "j")
map("x", "<S-Up>", "k")
map("x", "<S-Right>", "l")
map("x", "<S-Left>", "h")

