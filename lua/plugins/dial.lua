return {
  "monaqa/dial.nvim",
  -- recommended = true,
  -- desc = "Increment and decrement numbers, dates, and more",
  -- -- stylua: ignore
  -- keys = {
  --   { "<C-a>", function() return M.dial(true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
  --   { "<C-x>", function() return M.dial(false) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
  --   { "g<C-a>", function() return M.dial(true, true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
  --   { "g<C-x>", function() return M.dial(false, true) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
  -- },
  opts = function(_, opts)

    local augend = require("dial.augend")

    local finnish_numbers = augend.constant.new({
      -- elements through which we cycle. When we increment, we go down
      -- On decrement we go up
      elements = { "nolla", "yksi", "kaksi", "kolme", "neljä", "viisi", "kuusi",
        "seitsemän", "kahdeksan", "yhdeksän", "kymmenen" },
      -- if true, it only matches strings with word boundary. firstDate wouldn't work for example
      word = false,
      -- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
      -- Otherwise nothing will happen when there are no further values
      cyclic = true,
    })

    -- local logical_alias = augend.constant.new({
    --   elements = { "&&", "||" },
    --   word = false,
    --   cyclic = true,
    -- })

    -- local ordinal_numbers = augend.constant.new({
    --   -- elements through which we cycle. When we increment, we go down
    --   -- On decrement we go up
    --   elements = {
    --     "first",
    --     "second",
    --     "third",
    --     "fourth",
    --     "fifth",
    --     "sixth",
    --     "seventh",
    --     "eighth",
    --     "ninth",
    --     "tenth",
    --   },
    --   -- if true, it only matches strings with word boundary. firstDate wouldn't work for example
    --   word = false,
    --   -- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
    --   -- Otherwise nothing will happen when there are no further values
    --   cyclic = true,
    -- })

    -- local weekdays = augend.constant.new({
    --   elements = {
    --     "Monday",
    --     "Tuesday",
    --     "Wednesday",
    --     "Thursday",
    --     "Friday",
    --     "Saturday",
    --     "Sunday",
    --   },
    --   word = true,
    --   cyclic = true,
    -- })
    --
    -- local months = augend.constant.new({
    --   elements = {
    --     "January",
    --     "February",
    --     "March",
    --     "April",
    --     "May",
    --     "June",
    --     "July",
    --     "August",
    --     "September",
    --     "October",
    --     "November",
    --     "December",
    --   },
    --   word = true,
    --   cyclic = true,
    -- })
  --
  --   local capitalized_boolean = augend.constant.new({
  --     elements = {
  --       "True",
  --       "False",
  --     },
  --     word = true,
  --     cyclic = true,
  --   })
      --  return {
      --
      --   groups = {
      --     default = {
      --       finnish_numbers
      --   }
      -- }
    -- FIXME: js doesn't yet work.

    local javascript = {
      augend.constant.new({ elements = { "==", "!==" } }),
    }

    -- Ensure groups exist, then extend the default group
    opts.groups = opts.groups or {}
    opts.groups.default = opts.groups.default or {}
    table.insert(opts.groups.default, finnish_numbers)

    -- opts.groups.javascript = opts.groups.javascript or {} -- Ensure the 'javascript' group exists
    -- table.insert(opts.groups.javascript, augend.constant.new({ elements = { "==", "!==" } })) -- Add the javascript augend

    -- Define and register the 'javascript' group
    opts.groups.javascript = opts.groups.javascript or {}
    table.insert(opts.groups.javascript, augend.constant.new({ elements = { "==", "!==" } }))

    -- Map the group to the 'javascript' filetype
    opts.dials_by_ft = opts.dials_by_ft or {}
    opts.dials_by_ft.javascript = "javascript"

    return opts

  --   return {
  --     dials_by_ft = {
  --       css = "css",
  --       vue = "vue",
  --       javascript = "typescript",
  --       typescript = "typescript",
  --       typescriptreact = "typescript",
  --       javascriptreact = "typescript",
  --       json = "json",
  --       lua = "lua",
  --       markdown = "markdown",
  --       sass = "css",
  --       scss = "css",
  --       python = "python",
  --     },
  --     groups = {
  --       default = {
  --         augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
  --         augend.integer.alias.decimal_int, -- nonnegative and negative decimal number
  --         augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
  --         augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
  --         ordinal_numbers,
  --         weekdays,
  --         months,
  --         capitalized_boolean,
  --         augend.constant.alias.bool, -- boolean value (true <-> false)
  --         logical_alias,
  --       },
  --       vue = {
  --         augend.constant.new({ elements = { "let", "const" } }),
  --         augend.hexcolor.new({ case = "lower" }),
  --         augend.hexcolor.new({ case = "upper" }),
  --       },
  --       typescript = {
  --         augend.constant.new({ elements = { "let", "const" } }),
  --       },
  --       css = {
  --         augend.hexcolor.new({
  --           case = "lower",
  --         }),
  --         augend.hexcolor.new({
  --           case = "upper",
  --         }),
  --       },
  --       markdown = {
  --         augend.misc.alias.markdown_header,
  --       },
  --       json = {
  --         augend.semver.alias.semver, -- versioning (v1.1.2)
  --       },
  --       lua = {
  --         augend.constant.new({
  --           elements = { "and", "or" },
  --           word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
  --           cyclic = true, -- "or" is incremented into "and".
  --         }),
  --       },
  --       python = {
  --         augend.constant.new({
  --           elements = { "and", "or" },
  --         }),
  --       },
  --     },
  -- }
  end,
  -- config = function(_, opts)
  --   -- copy defaults to each group
  --   for name, group in pairs(opts.groups) do
  --     if name ~= "default" then
  --       vim.list_extend(group, opts.groups.default)
  --     end
  --   end
  --   require("dial.config").augends:register_group(opts.groups)
  --   vim.g.dials_by_ft = opts.dials_by_ft
  -- end,
}
