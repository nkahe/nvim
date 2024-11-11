
return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      -- Set the colorscheme
      vim.cmd("colorscheme vscode")

      -- Color overrides
      vim.api.nvim_set_hl(0, "Normal", { bg = "#1b1b1b" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f1f1f" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282c34" })
    end,
  },
}

