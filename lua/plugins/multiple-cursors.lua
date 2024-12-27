
return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",  -- Use the latest tagged version
  opts = {
    custom_key_maps = {
      -- Insert character before cursor
      {"n", "ä", function(register, count)
        -- Call the function for inserting character before cursor
        vim.cmd("normal <Plug>(ISC-insert-at-cursor)")
      end},

      -- Insert character after cursor
      {"n", "Ä", function(register, count)
        -- Call the function for appending character after cursor
        vim.cmd("normal <Plug>(ISC-append-at-cursor)")
      end},
    },
  },  -- This causes the plugin setup function to be called
  keys = {
    {"<C-A-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
    {"<C-A-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},

    {"<C-A-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
    {"<C-A-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},

    {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},

  },
}

    -- {"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
    -- {"<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},
    --
    -- {"<Leader>d", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
    -- {"<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},
    --
    -- {"<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
