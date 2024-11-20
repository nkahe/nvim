-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- NOTE: { noremap = true } is default so no need to add that.

-- Registers ----------------------------------------------

-- TODO: gr ei enää ole LSP referencelle.
-- rekistereitä pitäisi voida muuttaa.
-- select clipboard

-- x is same as d so it actually cuts to clipboard.
map({''}, "x", "d", { desc = "Cut" })
map({""}, "xx", "dd", { desc = "Cut" })
map({""}, "X", "D", { desc = "Cut end of line" })

-- d to use unnamed register so it doesn't populate clipboard.
map({""}, "d", '""d', { desc = "Delete" })
map({""}, "dd", '""dd', { desc = "Delete line" })
map({""}, "D", '""D', { desc = "Delete to end of line" })

-- Paste and indent
-- vim.keymap.set({ "n", "v" }, "p", "p`[v`]=`]")

-- "-" and <Del> to delete single character(s) without yanking. Also 'dl|h' works.
map({""}, "-", '"_x', { desc = "Delete character" })
map({""}, "<Del>", '"_x', { desc = "which_key_ignore" })
map("n", '<BS>', '"_X', { desc = "which_key_ignore" , silent = true })

-- vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- Don't yank selection when pasting with p in visual mode.
map("x", "p", "P")

-- Editing lines --------------------------------------------

-- Alt mappings can sometimes trigger with <esc> when using in terminal.
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", "<cmd><C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", "<cmd><C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- TODO voisi lukumäärän ottaa vastaan.
-- Add empty lines up/down while cursor and mode stays.

-- vim.api.nvim_set_keymap("n", "<Leader>iO", "m`O<Esc>``",
--   { desc = "Add empty line up.", noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<Leader>io", "m`o<Esc>``",
--   { desc = "Add empty line down.", noremap = true, silent = true })

-- Pitäisi olla parempi kuin yllä.
-- vim.api.nvim_set_keymap("n", "<Leader>io", ":set paste<CR>m`o<Esc>``:set nopaste<CR>",
--   { desc = "Add empty line down.", noremap = true, silent = true })

-- Cursor moves along.
-- vim.api.nvim_set_keymap("n", "<Leader>io", ":set paste<CR>o<Esc>:set nopaste<CR>",
--   { desc = "Add empty line down.", noremap = true, silent = true })

-- Add empty lines before and after cursor line
map('n', '<M-S-o>', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = "Add empty line up", silent = true })

map('n', '<M-o>', "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>",
  { desc = "Add empty line down", silent = true })

-- Misc ---------------------------------------------------

-- Focus previous / next buffer
map({"n", "i"}, "<M-Right>", "<cmd>bnext<CR>", { silent = true })
map({"n", "i"}, "<M-Left>", "<cmd>bprevious<CR>", { silent = true })
map("n", "<M-l>", "<cmd>bnext<CR>", { silent = true })
map("n", "<M-h>", "<cmd>bprevious<CR>", { silent = true })

-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

map({""}, "<C-Up>", "<C-y>", { desc = "Scroll up" })
map({""}, "<C-Down>", "<C-e>", { desc = "Scroll down" })

-- map("n", "<C-M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
-- map("n", "<C-M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-M-Down>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-M-Up>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })

-- In nordic keyboard easy to reach.
map("", "ö", "$", { noremap = false, silent = false, desc = "To end of line" })
-- vim.api.nvim_set_keymap("", "ö", "$", { noremap = false, silent = false, desc = "which_key_ignore" })
-- vim.api.nvim_set_keymap("n", "ä", "", { noremap = false, silent = false })
map("n", "<C-`>", "<CMD>lua Snacks.terminal.toggle()<CR>", { silent = true})
-- map("t", "<C-`>", "<C-\\><C-n><CMD>lua toggle_terminal()<CR>", { silent = true })

map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Tap C-\ twice to exit terminal mode
map('t', [[<C-\><C-\>]], [[<C-\><C-n>]], { silent = true })

map("n", "<Leader>O", "O<Esc>^Da", { desc = "Begin empty line up." })
map("n", "<Leader>o", "o<Esc>^Da", { desc = "Begin empty line down." })
map("i", "<S-CR>", "<Esc>o<Esc>^Da", { desc = "Begin empty line down." })

-- Add common shortcuts from GUI apps.
map("i", '<C-BS>', '<C-w>', { silent = true })
map("i", '<C-Del>', '<C-o>dw', { silent = true })

map('n', '<Leader>gl', function()
    Snacks.lazygit.open()
  end, { desc = "LazyGit", silent = true })

map('n', '<Leader>sp', "<Cmd>Telescope projects<CR>", { desc = "Projects", silent = true })

-- User commands ---------------------------------------

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

-- GUI --------------------------------------------------

if vim.g.neovide then
  -- Clipboard commands similar to terminals.

  -- paste main
  map('', '<C-S-v>', '"+P', { desc = "Paste from clipboard" })
  map('i', '<C-S-v>', '<C-o>"+P')
  map('t', '<C-S-v>', '<C-\\><C-n>"+Pi')
  vim.keymap.set('c', '<C-S-v>', '<C-R>+')

  -- Paste 2nd clipboard
  map('', '<S-Insert>', '"*P', { desc = "Paste selection" })
  map('i', '<S-Insert>', '<C-o>"*P')
  map('t', '<S-Insert>', '<C-\\><C-n>"*Pi')
  vim.keymap.set('c', '<S-Insert>', '<C-R>*')

  -- Copy
  map('v', '<C-S-c>', '"+y')
end

-- Minor tweaks ------------------------------------------

-- <CR> to open links in help in addition to ^]
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<C-]>", { silent = true })
  end,
})

-- Accidentally press on Shift+{arrow} to just move cursor in Visual mode
map("x", "<S-Down>", "j")
map("x", "<S-Up>", "k")
map("x", "<S-Right>", "l")
map("x", "<S-Left>", "h")

