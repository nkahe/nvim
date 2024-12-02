
-- if true then return {} end

return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        { "<Leader>N", group = "Notes (Obsidian)" },
        { "<Leader>t", group = "Terminal" },
      }
    }
  }
}

-- in normal file could be done like this

-- local wk = require("which-key")
-- wk.add({
--   { "<Leader>i", group = "insert" },
-- })
