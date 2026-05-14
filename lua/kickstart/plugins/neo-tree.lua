-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- nvim-web-devicons is omitted here; mini.icons mocks it (see custom/plugins/mini-icons.lua)
vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/s1n7ax/nvim-window-picker',
}

require('window-picker').setup {
  hint = 'floating-big-letter',
  selection_chars = 'FJDKSLA;CMRUEIWOQP',
  filter_rules = {
    include_current_win = false,
    autoselect_one = true,
    bo = {
      filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
      buftype = { 'terminal', 'quickfix' },
    },
  },
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  close_if_last_window = true,
  open_files_using_window_picker = true,
  window = {
    position = 'right',
    width = 60,
  },
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
