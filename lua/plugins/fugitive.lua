vim.pack.add { gh('tpope/vim-fugitive') }

vim.keymap.set('n', '<leader>gs', ':vertical Git<CR>', { desc = 'Git status' })
