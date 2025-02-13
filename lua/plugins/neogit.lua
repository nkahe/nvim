

vim.keymap.set("n", "<Leader>gn", "<cmd>Neogit<cr>", { desc = "Neogit" })

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    -- "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua",                 -- optional
    -- "echasnovski/mini.pick",         -- optional
  },
  config = true,
  opts = {
    commit_editor = {
      kind = "tab",
      show_staged_diff = true,
      -- Accepted values:
      -- "split" to show the staged diff below the commit editor
      -- "vsplit" to show it to the right
      -- "split_above" Like :top split
      -- "vsplit_left" like :vsplit, but open to the left
      -- "auto" "vsplit" if window would have 80 cols, otherwise "split"
      staged_diff_split_kind = "split",
      spell_check = false,
    },
  },
  -- "ascii"   is the graph the git CLI generates
  -- "unicode" is the graph like https://github.com/rbong/vim-flog
  -- "kitty"   is the graph like https://github.com/isakbm/gitgraph.nvim - use https://github.com/rbong/flog-symbols if you don't use Kitty
  graph_style = "unicode",
  signs = {
    -- { CLOSED, OPENED }
    hunk = { "", "" },
    item = { "", "" },
   -- item = { ">", "v" },
    section = { "", "" },
  },
}
