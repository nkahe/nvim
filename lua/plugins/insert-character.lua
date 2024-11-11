-- bagohart/Vim-Insert-Single-Character
-- https://github.com/bagohart/vim-insert-append-single-character

-- TODO: binding tällekin: <Plug>(ISC-append-at-cursor)
return {
  "bagohart/vim-insert-append-single-character",
  keys = {
    { "+", "<Plug>(ISC-insert-at-cursor)", mode = "n", desc = "Insert character" },
  },
}
