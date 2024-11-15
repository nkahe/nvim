-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.clipboard = "unnamedplus"

-- Color overrides

-- TODO laita toimimaan spec -tiedostosta.
-- vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#1f1f1f' })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f1f1f" })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#1b1b1b" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282c34" })

-- No format on save.
vim.g.autoformat = false

vim.opt.colorcolumn = "80"

-- vim.diagnostic.config({
--   virtual_text = false,
--   float = {
--     focusable = false,  -- Makes the floating window non-interactive
--     border = "rounded",  -- Add a border around the floating window
--     source = true,   -- Show the source of the diagnostic (e.g., LSP server)
--     -- severity_sort = true,  -- Sort diagnostics by severity
--   },
-- })

vim.opt.scrolloff = 7
vim.opt.spell = false
vim.opt.updatetime = 5000

-- Cursor can go paste last character and after block
vim.opt.virtualedit:append("block,onemore")


-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = "●",  -- Change the symbol for better visibility
--     spacing = 10,  -- Increase spacing (may help move it a bit further right, but not a large change)
--   },
--   float = {
--     focusable = false,
--     border = "rounded",
--     source = true,
--     severity_sort = true,
--   },
-- })

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

  vim.opt.title = true
  vim.opt.titlestring = "Neovide - LazyVim"
end
