return {
  "sphamba/smear-cursor.nvim",
  cond = function()
    -- Only load if not running in a GUI
    return vim.fn.has("gui_running") == 0
  end,
  opts = {                         -- Default  Range
    stiffness = 0.9,               -- 0.6      [0, 1]
    trailing_stiffness = 0.9,      -- 0.3      [0, 1]
    trailing_exponent = 0,         -- 0.1      >= 0
    distance_stop_animating = 0.7, -- 0.1      > 0
    hide_target_hack = false,      -- true     boolean
  },
}
