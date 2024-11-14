
-- Timeout for notifications longer so can actually read them.
return
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      notifier = {
        enabled = true,
        timeout = 6000,
      },
    }
  }
