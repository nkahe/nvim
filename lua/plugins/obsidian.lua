-- epwalsh/obsidian.nvim: Obsidian 🤝 Neovim https://github.com/epwalsh/obsidian.nvim
return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/notes",
      },
      {
        name = "nextcloud",
        path = "~/Nextcloud/Notes",
      },
    },
    "use_alias_only",
    ui = { enable = false },
  },
  -- UI is handler by render-markdown
  keys = {
    { "<Leader>sO", "<cmd>ObsidianSearch<CR>", mode = "n", desc = "Obsidian search" },
    { "<Leader>nn", ":ObsidianNew ", mode = "n", desc = "🆕 New note" },
    { "<Leader>no", "<cmd>ObsidianOpen<CR>", mode = "n", desc = "Open in Obsidian app" },
    { "<Leader>nr", "<cmd>ObsidianRename<CR>", mode = "n", desc = "Rename note" },
    { "<Leader>ns", "<cmd>ObsidianSearch<CR>", mode = "n", desc = "Search note" },
    { "<Leader>nq", "<cmd>ObsidianQuickSwitch<CR>", mode = "n", desc = "Quick switch" },
    { "<Leader>nw", "<cmd>ObsidianWorkspace<CR>", mode = "n", desc = "Change workspace" },
  }
}
