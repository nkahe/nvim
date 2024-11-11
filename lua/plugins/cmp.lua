return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- Disable ghost text by setting `cmp.config.window` to remove the preview
    opts.experimental = { ghost_text = false }
  end,
}
