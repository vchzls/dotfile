-- https://github.com/kyazdani42/nvim-tree.lua
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '.mypy' }
vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_auto_open = 1 -- opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1 -- closes the tree when it's the last window"
vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'} -- don't auto open tree on specific filetypes
vim.g.nvim_tree_quit_on_open = 1 -- closes the tree when you open a file
vim.g.nvim_tree_follow = 1 -- this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 0 -- this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 -- will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_root_folder_modifier = ':~' -- See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 1 -- will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_width_allow_resize  = 1 -- will not resize the tree when opening a file
vim.g.nvim_tree_disable_netrw = 0 -- disables netrw
vim.g.nvim_tree_hijack_netrw = 1 -- prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 1 -- append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 -- compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 1 -- will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
    git=1,
    folders=1,
    files=1,
}

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
    default='',
    symlink='',
    git={
        unstaged="",
        staged="✓",
        unmerged="",
        renamed="➜",
        untracked= "★",
        deleted= "",
        ignored= "◌"
    },
    folder= {
        default= "",
        open= "",
        empty= "",
        empty_open= "",
        symlink= "",
        symlink_open="",
    },
    lsp={
        hint="",
        info="",
        warning="",
        error="",
    }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    {key = "<CR>"           , cb = ":YourVimFunction()<cr>",},
    {key = "u"              , cb = ":lua require'some_module'.some_function()<cr>"},
    {key = "<CR>"           , cb = tree_cb("edit")},
    {key = "o"              , cb = tree_cb("edit")},
    {key = "l"              , cb = tree_cb("edit")},
    {key = "<2-LeftMouse>"  , cb = tree_cb("edit")},
    {key = "<2-RightMouse>" , cb = tree_cb("cd")},
    {key = "<C-]>"          , cb = tree_cb("cd")},
    {key = "<C-v>"          , cb = tree_cb("vsplit")},
    {key = "<C-x>"          , cb = tree_cb("split")},
    {key = "<C-t>"          , cb = tree_cb("tabnew")},
    {key = "<"              , cb = tree_cb("prev_sibling")},
    {key = ">"              , cb = tree_cb("next_sibling")},
    {key = "<BS>"           , cb = tree_cb("close_node")},
    {key = "<S-CR>"         , cb = tree_cb("close_node")},
    {key = "h"              , cb = tree_cb("close_node")},
    {key = "<Tab>"          , cb = tree_cb("preview")},
    {key = "I"              , cb = tree_cb("toggle_ignored")},
    {key = "H"              , cb = tree_cb("toggle_dotfiles")},
    {key = "R"              , cb = tree_cb("refresh")},
    {key = "a"              , cb = tree_cb("create")},
    {key = "d"              , cb = tree_cb("remove")},
    {key = "r"              , cb = tree_cb("rename")},
    {key = "<C-r>"          , cb = tree_cb("full_rename")},
    {key = "x"              , cb = tree_cb("cut")},
    {key = "c"              , cb = tree_cb("copy")},
    {key = "p"              , cb = tree_cb("paste")},
    {key = "[c"             , cb = tree_cb("prev_git_item")},
    {key = "]c"             , cb = tree_cb("next_git_item")},
    {key = "-"              , cb = tree_cb("dir_up")},
    {key = "q"              , cb = tree_cb("close")},
}

-- local opts = {silent=true, noremap=true}
-- vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- nnoremap <leader>r .NvimTreeRefresh<CR>
-- nnoremap <leader>n .NvimTreeFindFile<CR>
-- NvimTreeOpen and NvimTreeClose are also available if you need them
