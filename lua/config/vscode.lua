
-- This file is sourced if run in embedded VSCode instance.

-- vim.cmd("echo 'sourced vscode.lua'")

vim.keymap.set({ 'n', 'x' }, '<Space>', function()
    vim.fn.VSCodeNotify('whichkey.show')
  end, { silent = true, desc = "Show WhichKey" })
