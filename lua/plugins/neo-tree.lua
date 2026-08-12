vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>n', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

-- TODO: Should open neotree in a modal similar to telescope
require('neo-tree').setup {

  filesystem = {
    hijack_netrw_behavior = 'disabled',
    window = {
      mappings = {
        ['<leader>n'] = 'close_window',
      },
    },
  },
}
