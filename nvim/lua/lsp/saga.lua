local saga = require 'lspsaga'
saga.init_lsp_saga()
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<A-d>', '<Cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>', opts)
vim.api.nvim_set_keymap('t', '<A-d>', [[<C-\><C-n>:lua require("lspsaga.floaterm").close_float_terminal()<CR>]], opts)

