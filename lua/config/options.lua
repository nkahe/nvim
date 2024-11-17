-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.clipboard = "unnamedplus"

-- No format on save.
vim.g.autoformat = false
vim.opt.colorcolumn = "80"
vim.opt.selectmode = "key"
vim.opt.scrolloff = 7
vim.opt.spell = false
vim.opt.title = true
vim.opt.updatetime = 5000
-- Cursor can go paste last character and after block
vim.opt.virtualedit:append("block,onemore")

-- Optionally you can use an autocommand to automatically open floating diagnostics for LSP errors
-- vim.cmd([[
--   autocmd CursorHold * lua vim.diagnostic.open_float({scope="line"})
-- ]])

-- GUI ------------------------------------------

-- Neovide
if vim.g.neovide then
  vim.opt.guifont = { "FiraCode Nerd Font", ":h12" }
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.08
end
