return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      -- Display a preview of the selected item on the current line
      ghost_text = {
        enabled = false,
      },
      -- Insert completion item on selection, don't select by default
      list = { selection = 'auto_insert' },
    },
    keymap = {
      preset = "super-tab",
    },
  }
}
