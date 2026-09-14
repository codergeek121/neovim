vim.pack.add { gh('tpope/vim-fugitive') }

vim.keymap.set('n', '<leader>gs', ':vertical Git<CR>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>gm', ':Git mergetool<CR>', { desc = 'Git mergetool (merge conflicts)' })
