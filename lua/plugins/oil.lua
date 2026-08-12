vim.pack.add({ gh('stevearc/oil.nvim') })
vim.pack.add({ gh('refractalize/oil-git-status.nvim') })

local oil = require('oil')

-- avoid going up to higher than cwd
local function guarded_parent()
  local current_dir = oil.get_current_dir()
  if not current_dir then
    return
  end

  local boundary = vim.fn.getcwd()

  local norm_current = vim.fn.fnamemodify(current_dir, ":p")
  local norm_boundary = vim.fn.fnamemodify(boundary, ":p")

  if norm_current == norm_boundary then
    vim.notify("Already at project root — won't go higher", vim.log.levels.WARN)
    return
  end

  require("oil.actions").parent.callback()
end

oil.setup({
  default_file_explorer = true,
  win_options = {
    signcolumn = "yes:2"
  },
  keymaps = {
    ["-"] = {
      callback = guarded_parent,
      mode = "n",
      desc = "Go to parent directory (bounded at cwd)",
    },
  },
})

vim.keymap.set('n', '<leader>wv', '<Cmd>vsplit<CR><Cmd>Oil<CR>', { desc = 'Oil in vsplit' })
vim.keymap.set('n', '<leader>ws', '<Cmd>split<CR><Cmd>Oil<CR>', { desc = 'Oil in split' })


require('oil-git-status').setup({ show_ignored = true })
vim.api.nvim_set_hl(0, "OilGitStatusIndexIgnored", { link = "Comment" })
vim.api.nvim_set_hl(0, "OilGitStatusWorkingTreeIgnored", { link = "Comment" })
