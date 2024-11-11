-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.clipboard = "unnamedplus"

-- Color overrides
vim.api.nvim_set_hl(0, 'Normal', {bg = '#1b1b1b'})
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1f1f1f' })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#1f1f1f' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#282c34' })

vim.api.nvim_set_hl(0, "TermNormal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })

-- No format on save.
vim.g.autoformat = false

vim.opt.colorcolumn = "80"

vim.opt.updatetime = 5000

vim.opt.virtualedit:append("block,onemore")


-- GUI ------------------------------------------

if vim.g.neovide then
  vim.opt.guifont = { "FiraCode Nerd Font", ":h12" }
    -- Put anything you want to happen only in Neovide here
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.08
end
