return {
  "MeanderingProgrammer/render-markdown.nvim",
  keys= {
    { "<Leader>um", "<cmd>RenderMarkdown toggle<CR>", mode = "n", desc = "Toggle Render Markdown" },
  },
  -- Are in theme's config atm.
  -- config = function(_, opts)
      -- vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#22263a' })
      -- vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#2c272b' })
      -- vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#242b2b' })
      -- vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#172830' })
  -- end,
}
