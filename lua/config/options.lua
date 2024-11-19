-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.clipboard = "unnamedplus"

-- No format on save.
vim.g.autoformat = false

local options = {
  colorcolumn = "80",
  guifont = { "FiraCode Nerd Font", ":h12" },
  selectmode = "key",
  scrolloff = 7,
  spell = false,
  title = true,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- Cursor can go paste last character and after block
vim.opt.virtualedit:append("block,onemore")
-- Optionally you can use an autocommand to automatically open floating diagnostics for LSP errors
-- vim.cmd([[
--   autocmd CursorHold * lua vim.diagnostic.open_float({scope="line"})
-- ]])

vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = '#73c991' })

-- GUI ------------------------------------------

-- Neovide
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.08
end
