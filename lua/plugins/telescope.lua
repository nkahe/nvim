
if true then return {} end

return {
 "nvim-telescope/telescope.nvim",
 keys = { {"<C-P>", "<cmd>Telescope find_files<cr>", desc = "Find Files"} },
  opts = function(_, opts)
    -- Add ignore patterns to existing configuration
    opts.defaults = opts.defaults or {}
    opts.defaults.file_ignore_patterns = vim.list_extend(
      opts.defaults.file_ignore_patterns or {},
      { "node_modules/", "%.sqlite$", "%.png$", "%.jpg$", "%.jpeg$", "%.gif$", "%.bmp$", "%.tiff$", "%.webp$" }
    )
  end,
}
