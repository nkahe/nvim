-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Get Neovim's config home directory
-- local config_dir = vim.fn.stdpath("config") .. "/lua/config/"

-- -- Set up an autocommand for sourcing files upon saving in the "lua/config/" directory
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = config_dir .. "*.lua",
--   callback = function(args)
--     vim.cmd("source " .. args.file)
--     print("Sourced " .. args.file)
--   end,
--   desc = "Automatically source files on save in lua/config/",
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "lua/config/*.lua",
--   callback = function(args)
--     vim.cmd("source " .. args.file)
--     print("Sourced " .. args.file)
--   end,
--   desc = "Automatically source files on save in lua/config/",
-- })


-- Watches for saves specifically in the `lua/config/` directory
local config_dir_pattern = vim.fn.stdpath("config") .. "/lua/config/*.lua"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = config_dir_pattern,
  callback = function(args)
    vim.cmd("source " .. args.file)
    print("Sourced " .. args.file)
  end,
})

-- vim.api.nvim_create_autocmd("TermOpen", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
--   end,
-- })


-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "terminal",  -- This triggers for terminal buffers
--   callback = function()
--     if vim.fn.win_gettype() == "popup" then
--       -- Set the background color for floating terminal windows
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })  -- Set your color
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = "term://*",  -- Triggers on terminal buffers
--   callback = function()
--     -- Check if the window is a floating window
--     if vim.fn.win_gettype() == "popup" then
--       -- Set the background color for floating terminals
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })  -- Set the desired color
--     end
--   end,
-- })

