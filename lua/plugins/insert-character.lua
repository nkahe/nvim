-- bagohart/Vim-Insert-Single-Character
-- https://github.com/bagohart/vim-insert-append-single-character

-- For nordic and german keyboard layouts.

return {
  "bagohart/vim-insert-append-single-character",
  keys = {
    { "ä", "<Plug>(ISC-insert-at-cursor)", mode = "n", desc = "Insert character before cursor" },
    { "Ä", "<Plug>(ISC-append-at-cursor)", mode = "n", desc = "Insert character after cursor" },
  },
  vscode = true
}
