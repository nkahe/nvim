-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Get Neovim's config home directory
local config_dir = vim.fn.stdpath("config") .. "/lua/config/"

-- Set up an autocommand for sourcing files upon saving in the "lua/config/" directory
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = config_dir .. "*.lua",
  callback = function(args)
    vim.cmd("source " .. args.file)
    print("Sourced " .. args.file)
  end,
  desc = "Automatically source files on save in lua/config/",
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "TermNormal", { bg = "#000000" })
  end,
})
