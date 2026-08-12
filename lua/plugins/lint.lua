vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }

local lint = require 'lint'
-- lint.linters_by_ft = {
--   markdown = { 'markdownlint' }, -- TODO: How to ensure linters / tools are installed. I think this should not be a neovim concern...
-- }

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.bo.modifiable then lint.try_lint() end
  end,
})
