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
-- local config_dir_pattern = vim.fn.stdpath("config") .. "/lua/config/*.lua"

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = config_dir_pattern,
--   callback = function(args)
--     vim.cmd("source " .. args.file)
--     print("Sourced " .. args.file)
--   end,
-- })


-- Watches for saves specifically in the `lua/config/keymaps.lua` and `lua/config/options.lua` files
local config_path = vim.fn.stdpath("config") .. "/lua/config/"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { config_path .. "keymaps.lua", config_path .. "options.lua" },
  callback = function(args)
    vim.cmd("source " .. args.file)
    print("Sourced " .. args.file)
  end,
})

local function get_terminal_name()
  if vim.g.neovide then
    terminalName = "Neovide"
  end
  return terminalName
end

-- Function to update the Yakuake terminal tab title
local function update_yakuake_title()
  -- Get the current buffer name (just the file name, not the full path)
  local buffer_name = vim.fn.expand('%:t')

  -- If no file is open, we just set the title to "Neovim" or similar
  if buffer_name == "" then
    buffer_name = "Neovim"
  end

  -- Set the Yakuake tab title using the session_id and buffer_name
  vim.fn.system(string.format("qdbus org.kde.yakuake /yakuake/tabs setTabTitle %s \"%s\"", Session_id, buffer_name))
end

-- Get the current Yakuake session id using qdbus
Session_id = vim.fn.system("qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId")

-- Trim any extra whitespace from the session_id
Session_id = vim.fn.trim(Session_id)

if Session_id ~= "" then
  -- Autocmd to update Yakuake title on buffer changed
  vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost"}, {
    callback = update_yakuake_title
  })
end

-- Text formats. ftplugin file for Markdown didn't work.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
