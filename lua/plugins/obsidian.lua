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
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/private_notes",
      },
      {
        name = "nextcloud",
        path = "~/Nextcloud/notes",
      },
    },
    "use_alias_only",
    -- Markdown UI is handled by render-markdown
    ui = {
      enable = false,
      checkboxes = {
        -- Get rid of other checkbox values.
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" }
        -- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        -- ["!"] = { char = "", hl_group = "ObsidianImportant" },
        -- Replace the above with this if you don't have a patched font:
        -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      }
    },
  },
  keys = {
    { "<Leader>sO", "<cmd>ObsidianSearch<CR>", mode = "n", desc = "Obsidian search" },
    { "<Leader>Nn", ":ObsidianNew ", mode = "n", desc = "🆕 New note" },
    { "<Leader>No", "<cmd>ObsidianOpen<CR>", mode = "n", desc = "Open in Obsidian app" },
    { "<Leader>Nr", "<cmd>ObsidianRename<CR>", mode = "n", desc = "Rename note" },
    { "<Leader>Ns", "<cmd>ObsidianSearch<CR>", mode = "n", desc = "Search note" },
    { "<Leader>Nq", "<cmd>ObsidianQuickSwitch<CR>", mode = "n", desc = "Quick switch" },
    { "<Leader>Nw", "<cmd>ObsidianWorkspace<CR>", mode = "n", desc = "Change workspace" },
  }
}
