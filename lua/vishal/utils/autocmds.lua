local lint = require("lint")
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" },
  python = { "pylint" },
}


vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })

vim.api.nvim_create_autocmd({ "BufWritePost", }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
