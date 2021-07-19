local function enable_options(options)
    for _, option in ipairs(options) do
        -- TODO fix this
        -- vim.b[option] = true
        -- vim.o[option] = true
        vim.cmd('set '..option)
    end
end

local function set_options(options)
    for _, option in ipairs(options) do
        -- TODO fix this
        -- vim.b[option[1]] = option[2]
        -- vim.o[option[1]] = option[2]
        vim.cmd('set '..option[1]..'='..option[2])
    end
end


local function let_options(options)
    for _, option in ipairs(options) do
        vim.cmd('let '..option[1]..'='..option[2])
    end
end

vim.cmd('filetype plugin on')
vim.cmd('syntax enable')

enable_options({
    'spell',
    'expandtab',
    'termguicolors',
    'wildmenu', -- tabcomplete
    'list', -- show tabs and blankspace
    'nu', 'rnu', -- line numbers
    'splitright',
    'splitbelow',
    'autowrite', -- autowrite on :make
    'nowrapscan',
})

set_options({
    {'scrolloff', 1}, {'sidescrolloff', 5}, -- min lines around cursor
    {'complete', '.,w,b,u,t,i,kspell'}, -- completion
    {'wildmode', 'longest:full,full'}, -- tabcomplete
    {'tabstop', 8}, {'shiftwidth', 4}, {'softtabstop', 4}, -- default indentation
    {'grepprg', [[rg\ --vimgrep\ --smart-case\ --follow]]}, -- use ripgrep as grep program
    {'switchbuf', 'useopen,usetab,newtab'}, -- Specify the behavior when switching between buffers
    {'stal', 2},
    {'timeoutlen', 500},
    {'updatetime', 300},
})

let_options({
    -- netrw
    {'netrw_liststyle', 3},
    {'netrw_banner', 0},
    {'netrw_browse_split', 2},
    {'netrw_altv', 1},
    {'netrw_winsize', 25},
    {'asyncrun_open', 6}
})

vim.cmd('set formatoptions-=cro') -- Don't insert comments
-- vim.cmd('colorscheme onedark')
-- vim.cmd('colorscheme nord')
vim.cmd('colorscheme one')

-- python
vim.cmd("let g:python3_host_prog = expand('/usr/bin/python3')")

vim.cmd("let g:asynctasks_extra_config = ['~/.config/nvim/g_tasks.ini']")
vim.cmd("let g:asynctask_template = ['~/.config/nvim/asynctasks/cmake.ini', '~/.config/nvim/asynctasks/cargo.ini']")
vim.cmd("let g:asynctasks_config_name = '.tasks.ini'")
