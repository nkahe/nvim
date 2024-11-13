
-- if true then return {} end

return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        { "<Leader>i", group = "insert" },
      }
    }
  }
}

-- in normal file could be done like this

-- local wk = require("which-key")
-- wk.add({
--   { "<Leader>i", group = "insert" },
-- })
