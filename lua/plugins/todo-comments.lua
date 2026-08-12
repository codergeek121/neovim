vim.pack.add { gh 'folke/todo-comments.nvim' }
-- TODO: Ignore the trailing :
require('todo-comments').setup {
  signs = false,
  gui_style = {
    bg = 'NONE',
    fg = 'NONE',
  },
}
