-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Helper functions ---------------------------------------

-- Create key mappings
local function map(mode, source_key, target_key, opts)
  -- Default options if not provided
  -- opts = opts or { noremap = true, silent = true }
  vim.keymap.set(mode, source_key, target_key, opts)
  -- vim.api.nvim_set_keymap(mode, source_key, target_key, opts)
end

-- Create mappings in most common modes
local function mapAll(key, command, opts)
  -- Default options if not provided
  -- opts = opts or { noremap = true, silent = true }
  vim.keymap.set({"n", "x"}, key, command, opts)
  vim.keymap.set({"i", "s"}, key, "<C-o>" .. command, opts)
end

-- Whichkey  ----------------------------------------------

-- local wk = require("which-key")

-- wk.add({
--   { "<Leader>i", group = "insert" },
-- })

-- Registers ----------------------------------------------

-- TODO: gr ei enää ole LSP referencelle.
-- rekistereitä pitäisi voida muuttaa.
-- select clipboard

-- x is same as d so it actually cuts to clipboard.
map({'n', 'x'}, "x", "d", { desc = "Cut" })
map({"n", "x"}, "xx", "dd", { desc = "Cut" })
map({"n", "x"}, "X", "D", { desc = "Cut end of line" })

-- d to use unnamed register so it doesn't populate clipboard.
map({"n", "x"}, "d", '""d')
map({"n", "x"}, "dd", '""dd')
map({"n", "x"}, "D", '""D')

-- Paste and indent
-- vim.keymap.set({ "n", "v" }, "p", "p`[v`]=`]")

-- "-" and <Del> to delete single character(s) without yanking. Also 'dl|h' works.
map({"n", "x"}, "-", '"_x', { desc = "Delete character" })
map({"n", "x"}, "<Del>", '"_x')

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

-- Misc ---------------------------------------------------

-- Map Alt-Left|Right to move previous / next buffer
mapAll("<M-Right>", ":bnext<CR>", { silent = true })
mapAll("<M-Left>", ":bprevious<CR>", { silent = true })

-- In nordic keyboard layout make some characters easier to type
-- vim.keymap.set doesn't work
vim.api.nvim_set_keymap("n", "ö", "[", { noremap = false, silent = false })
vim.api.nvim_set_keymap("n", "ä", "]", { noremap = false, silent = false })
map({"n", "o", "x"}, "¤", "$", { noremap = false, silent = false })

map("n", "<Leader>O", "O<Esc>^Da", { desc = "Begin empty line up."})
map("n", "<Leader>o", "o<Esc>^Da", { desc = "Begin empty line down."})
map("i", "<S-CR>", "<Esc>o<Esc>^Da", { desc = "Begin empty line down."})

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
vim.keymap.set('n', '<Leader>iO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
 { desc = "Add empty line up", silent = true })

vim.keymap.set('n', '<Leader>io', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
 { desc = "Add empty line down", silent = true })

-- Add common shortcuts from GUI apps.
map("i", '<C-BS>', '<C-w>', { silent = true })
map("i", '<C-Del>', '<C-o>dw', { silent = true })
map("n", '<BS>', '"_X', { silent = true })

-- vim.keymap.set("n", "<C-P>", "<cmd>LazyVimFileFinder<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-P>", "<leader>ff")

-- Restore defaults
vim.keymap.set("n", "H", "H", { desc = "Move cursor to top of screen" })
vim.keymap.set("n", "L", "L", { desc = "Move cursor to bottom of screen" })

-- Change cwd to match current buffer's directory
vim.api.nvim_create_user_command('Cdb', function()
  vim.cmd('cd ' .. vim.fn.expand('%:p:h'))
  vim.cmd('pwd')
end, {})

-- Neovide GUI
if vim.g.neovide then
  -- Clipboard commands similar to terminals.
  vim.keymap.set('c', '<C-v>', '<C-R>+')
  vim.keymap.set('c', '<C-S-v>', '<C-R>+')
  vim.keymap.set('c', '<S-Insert>', '<C-R>*')
  map({ 'i' }, '<C-S-v>', '<C-o>"+P')
  map({ 'i' }, '<C-S-Insert>', '<C-o>"*P')
  map({ 's', "x" }, '<C-S-c>', '"+y')
end

-- Minor tweaks ------------------------------------------

-- <CR> to open links in help in addition to ^]
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<C-]>", { silent = true })
  end,
})

-- Shift+Down and Shift+Up to just move down and up in Visual mode
map("x", "<S-Down>", "j")
map("x", "<S-Up>", "k")
map("x", "<S-Right>", "l")
map("x", "<S-Left>", "h")

