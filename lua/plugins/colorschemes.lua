vim.pack.add { gh 'folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
  },
}

vim.pack.add { gh 'rebelot/kanagawa.nvim' }
require('kanagawa').setup({
	commentStyle = { italic = false }
})

vim.cmd.colorscheme 'kanagawa'
