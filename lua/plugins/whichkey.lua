
-- Assuming you're in your LazyVim setup file, add the configuration under your "which-key" setup
return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    -- Define a new group under <Leader>i
    wk.add({
      { "<Leader>i", name = "+insert" },
    })

    -- You can also add other groups or mappings here as needed
  end,
}



-- local wk = require("which-key")

-- wk.add({
--   { "<Leader>i", group = "insert" },
-- })
