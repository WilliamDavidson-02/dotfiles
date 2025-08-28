local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files({
    previewer = false,  -- hide preview window
    find_command = {
      "rg",
      "--files",
      "--hidden",
      "--glob", "!node_modules/**",
      "--glob", "!.git/**",
    },
  })
end, { desc = 'Telescope find files ignoring node_modules' })

vim.keymap.set("n", "<leader>fg", function()
  builtin.live_grep({
    previewer = false,  -- hide preview window
  })
end, { desc = "Telescope live grep without preview" })

vim.keymap.set("n", "<leader>fw", function()
  builtin.live_grep({
    default_text = vim.fn.expand("<cword>"),
    previewer = false,  -- hide preview window
  })
end, { desc = "Live grep word under cursor without preview" })

