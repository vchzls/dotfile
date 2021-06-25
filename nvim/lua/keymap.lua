vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local function set_keymap(mode, opts, keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
end

-- normal {{{1
set_keymap('n', {noremap=true, silent=true}, {
    -- remap leader keys to noop
    {'<Space>', '<NOP>'},
    {'\\', ''},

    -- TODO
    -- execute q macro
    -- {'m', '@q'},

    -- TODO
    -- source config
    -- {'<C-s>', ':lua require("funcs.source").config()<CR>'},

    -- TODO
    -- Jump list
    {'[j', '<C-o>'},
    {']j', '<C-i>'},

    -- Move between windows
    {'<C-h>', '<C-w>h'},
    {'<C-j>', '<C-w>j'},
    {'<C-k>', '<C-w>k'},
    {'<C-l>', '<C-w>l'},

    -- Split windows
    {'<C-w>\\', ':vsplit<CR>'},
    {'<C-w>-', ':split<CR>'},

    -- Page down/up
    {'[d', '<PageUp>'},
    {']d', '<PageDown>'},

    -- Move between tabs
    {'<A-h>', 'gT'},
    {'<A-l>', 'gt'},

    -- Resize split
    {'<Up>', ':resize +2<CR>'},
    {'<Down>', ':resize -2<CR>'},
    {'<Left>', ':vertical resize +2<CR>'},
    {'<Right>', ':vertical resize -2<CR>'},

    -- Navigate buffers
    -- {'<Tab>', ':bnext<CR>'},
    -- {'<S-Tab>', ':bprevious<CR>'},
})

-- visual {{{1 TODO
-- set_keymap('x', {noremap=true, silent=true}, {
--     -- Allow pasting same thing many times
--     {'p', '""p:let @"=@0<CR>'},
-- 
--     -- better indent
--     {'<', '<gv'},
--     {'>', '>gv'},
-- 
--     -- Visual mode pressing * or # searches for the current selection
--     {'*', ':<C-u>lua require("funcs.search").visual_selection("/")<CR>/<C-r>=@/<CR><CR>'},
--     {'#', ':<C-u>lua require("funcs.search").visual_selection("?")<CR>?<C-r>=@/<CR><CR>'},
-- 
--     -- move selected line(s)
--     {'K', ':move \'<-2<CR>gv-gv'},
--     {'J', ':move \'>+1<CR>gv-gv'},
-- })

-- insert
set_keymap('i', {noremap=true, silent=true}, {
    -- Smart way to move between tabs
    -- {'<A-h>', [[<C-\><C-n>gT]]},
    -- {'<A-l>', [[<C-\><C-n>gt]]},

    -- alternative esc
    {'jk', '<Esc>'},
    {'kj', '<Esc>'},
    {'jj', '<Esc>'},
    {'kk', '<Esc>'},

    -- insert special carachters
    -- {'<C-b>', '<C-k>'},

    -- navigate display lines
    -- {'<Down>', '<Esc>gja'},
    -- {'<Up>', '<Esc>gka'},
})

-- terminal
set_keymap('t', {noremap=true, silent=true}, {
    -- quickfix from buffer
    {'<C-q>', [[<C-\><C-n>:lua require("funcs.quicklist").create_from_buffer()<CR>]]},
    {'<C-`>', '<m-=>'},

    -- escape in terminal
    {'<Esc>', [[<C-\><C-n>]]},
    {'<A-[>', '<Esc>'},

    -- Smart way to move between windows
    {'<C-h>', [[<C-\><C-N><C-w>h]]},
    {'<C-j>', [[<C-\><C-N><C-w>j]]},
    {'<C-k>', [[<C-\><C-N><C-w>k]]},
    {'<C-l>', [[<C-\><C-N><C-w>l]]},
    -- Smart way to move between tabs
    {'<A-h>', [[<C-\><C-N>gT]]},
    {'<A-l>', [[<C-\><C-N>gt]]},
})


-- leader
local status, wk = pcall(require, "whichkey_setup")
if not (status) then
   return
end

-- normal
local which_key_map = {}
-- general
which_key_map['Q'] = {'<Cmd>wqa<CR>', 'save quit all'}
which_key_map['S'] = {'<Cmd>wa<CR><Cmd>mksession!<CR><Cmd>qa<CR>', 'save session quit all'}
which_key_map['<CR>'] = {'<Cmd>noh<CR><Plug>SearchantStop<CR>', 'no search hl'}
which_key_map['*'] = {'*<Cmd>lua require("funcs.search").vim("*."..vim.fn.expand("%:e"))<CR>', 'vimgrep cursor'}
which_key_map['/'] = {'comment toggle'}
which_key_map[';'] = {':Dashboard', 'home screen'}
which_key_map['?'] = {':NvimTreeFindFile', 'find current file'}
which_key_map['e'] = {':NvimTreeToggle<CR>' , 'explorer'}
which_key_map['h'] = {'<C-W>s' , 'split below'}
which_key_map['H'] = {':let @/ = ""' , 'no highlight'}
which_key_map['r'] = {':RnvimrToggle', 'ranger'}
which_key_map['v'] = {'<C-W>v' , 'split right'}

which_key_map.b = {
    nam = '+buffer',
    l = { ':BufferNext<CR>'                    , 'goto next'},
    h = { ':BufferPrevious<CR>'                , 'goto prev'},
    L = { ':BufferMoveNext<CR>'                , 'move next'},
    H = { ':BufferMovePrevious<CR>'            , 'move prev'},
    b = { ':BufferPick<CR>'                    , 'pick buffer'},
    d = { ':BufferClose<CR>'                   , 'delete-buffer'},
    n = { 'bnext'                              , 'next-buffer'},
    p = { 'bprevious'                          , 'previou-buffer'},
    s = { 'Buffers'                            , 'fzf-buffer'},
    a = { ':bufdo bd<CR>'                      , 'do'},
}

which_key_map.d = {
    name = '+debug',
    b = { '<Cmd>lua require"dap".toggle_breakpoint()<CR>'        , 'toggle breakpoint'},
    c = { '<Cmd>lua require"dap".continue()<CR>'                 , 'continue'},
    i = { '<Cmd>lua require"dap".step_into()<CR>'                , 'step into'},
    o = { '<Cmd>lua require"dap".step_over()<CR>'                , 'step over'},
    O = { '<Cmd>lua require"dap".step_out()<CR>'                 , 'step out'},
    r = { '<Cmd>lua require"dap".repl.toggle()<CR>'              , 'toggle repl'},
    s = { '<Cmd>lua require"dap".continue()<CR>'                 , 'start'},
}

which_key_map.f = {
    name = '+file/find',
    b = { ':Telescope buffers<CR>'                   , 'buffers'},
    f = { ':Telescope find_files<CR>'                  , 'find files'},
    g = { ':Telescope live_grep<CR>'                   , 'live_grep'},
    h = { ':Telescope help tags<CR>'                   , 'help tags'},
    ['='] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'format'}
}

which_key_map.s = {
      name = '+search/session',
      T = { ':Telescope filetypes'                   , 'filetypes'},
      B = { ':Telescope git_branches'                , 'git branches'},
      d = { ':Telescope lsp_document_diagnostics'    , 'document_diagnostics'},
      D = { ':Telescope lsp_workspace_diagnostics'   , 'workspace_diagnostics'},
      h = { ':Telescope command_history'             , 'history'},
      i = { ':Telescope media_files'                 , 'media files'},
      m = { ':Telescope marks'                       , 'marks'},
      M = { ':Telescope man_pages'                   , 'man_pages'},
      o = { ':Telescope vim_options'                 , 'vim_options'},
      t = { ':Telescope live_grep'                   , 'text'},
      r = { ':Telescope registers'                   , 'registers'},
      w = { ':Telescope file_browser'                , 'buf_fuz_find'},
      u = { ':Telescope colorscheme'                 , 'colorschemes'},
      s = { ':SessionSave'                           , 'save session'},
      l = { ':SessionLoad'                           , 'load Session'},
}

which_key_map.g = {
      name = '+git' ,
      b = {':GitBlameToggle'                   , 'blame'},
      B = {':GBrowse'                          , 'browse'},
      d = {':Git diff'                         , 'diff'},
      j = {':NextHunk'                         , 'next hunk'},
      k = {':PrevHunk'                         , 'prev hunk'},
      l = {':Git log'                          , 'log'},
      p = {':PreviewHunk'                      , 'preview hunk'},
      r = {':ResetHunk'                        , 'reset hunk'},
      R = {':ResetBuffer'                      , 'reset buffer'},
      s = {':StageHunk'                        , 'stage hunk'},
      S = {':Gstatus'                          , 'status'},
      u = {':UndoStageHunk'                    , 'undo stage hunk'},
}


which_key_map.l = {
      name = '+lsp',
      a = {'<Cmd>lua require("lspsaga.codeaction").code_action()<CR>'                , 'code action'},
      d = {':Telescope lsp_document_diagnostics' , 'document diagnostics'},
      D = {':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'},
      I = {':LspInfo<CR>'                            , 'lsp info'},
      v = {':LspVirtualTextToggle'               , 'lsp toggle virtual text'},
      l = {':Lspsaga lsp_finder'                 , 'lsp finder'},
      L = {':Lspsaga show_line_diagnostics'      , 'line_diagnostics'},
      p = {':Lspsaga preview_definition'         , 'preview definition'},
      q = {':Telescope quickfix'                 , 'quickfix'},
      r = {':Lspsaga rename<CR>'                     , 'rename'},
      T = {':LspTypeDefinition'                  , 'type defintion'},
      x = {':cclose'                             , 'close quickfix'},
      s = {':Telescope lsp_document_symbols'     , 'document symbols'},
      S = {':Telescope lsp_workspace_symbols'    , 'workspace symbols'},
}


which_key_map.t = {
    name = '+terminal',
    t = {':call TerminalToggle()<CR>', 'terminal'},
    p = {':H ipython<CR>', 'python'},
}

which_key_map.w = {
    name = '+window/worspace',
    a = {'<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace'},
    r = {'<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace'},
    l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace'},
}

wk.register_keymap('leader', which_key_map)

-- visual {{{1
local which_key_visual_map = {}
-- search
which_key_visual_map.s = {
    name = '+search',
    s = {':call v:lua.grep.operator(visualmode())<CR>', 'grep visual'},
}

wk.register_keymap('visual', which_key_visual_map)

