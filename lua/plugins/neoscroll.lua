
-- karb94/neoscroll.nvim: Smooth scrolling neovim plugin written in lua.
-- https://github.com/karb94/neoscroll.nvim

return {
  "karb94/neoscroll.nvim",
  cond = function()
    -- Only load if not running in a GUI
    return vim.fn.has("gui_running") == 0
  end,
  config = function()
    local neoscroll = require('neoscroll')

    -- Setup with default easing function
    neoscroll.setup({
      easing = "quadratic"
    })

    -- Define key mappings with specific easing functions
    local keymap = {
      -- Use the "sine" easing function
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 200, easing = 'sine' }) end,
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 200, easing = 'sine' }) end,
      -- Use the "circular" easing function
      ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 400, easing = 'circular' }) end,
      ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 400, easing = 'circular' }) end,
      -- Custom scroll behavior for <C-y> and <C-e>
      ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
      ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
      ["<C-Down>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
      ["<C-Up>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
    }

    -- Set key mappings for specified modes
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func, { silent = true })
    end
  end,
}
