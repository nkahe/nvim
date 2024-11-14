
return {
  {
    "Mofiqul/vscode.nvim",
    opts = {
      color_overrides = {

        -- Normal & signcolumn bg
        vscBack = '#1b1b1b',

        -- Cursorline, vertical ColorColumn
        vscCursorDarkDark = '#1f1f1f',

        -- Floating windowws, terminals etc.
        vscPopupBack = '#262626'
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
      --   },
      -- })

  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  }
}

