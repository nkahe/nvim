
return {
  {
    "Mofiqul/vscode.nvim",
    opts = {
      color_overrides = {
        vscBack = '#1b1b1b',
        vscCursorDarkDark = '#1f1f1f'
      }
    }
    -- opts = function()
      -- local c = require("").get_colors()
      -- require("vscode").setup({
      --   transparent = true,
      --   italic_comments = true,
      --   underline_links = true,
      --   disable_nvimtree_bg = true,
      --   group_overrides = {
      --     ColorColumn = { bg = "#1f1f1f" },
      --     CursorLine = { bg = "#1f1f1f" },
      --     Normal = { bg = "#1b1b1b" },
      --     SignColumn = { bg = "#282c34" },
      --   },
      -- })


      -- Set the colorscheme
      -- vim.cmd("colorscheme vscode")
      -- local c = require("vscode.colors").get_colors()
      -- require("vscode").setup({
      -- }
      -- Color overrides
      -- vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#1f1f1f' })
      -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f1f1f" })
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "#1b1b1b" })
      -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282c34" })
    -- end,
  },


  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  }
}

