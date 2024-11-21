
-- Timeout for notifications longer so can actually read them.
return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      enabled = true,
      timeout = 6000,
    },
  },
}
