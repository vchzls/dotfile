vim.o.completeopt = "menu,menuone,noselect"

vim.g.UltiSnipsExpandTrigger = "<C-s>"      
vim.g.UltiSnipsJumpForwardTrigger = "<C-j>" 
vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"

require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        -- enabled
        path = true,
        buffer = true,
        nvim_lsp = true,
        calc = true,
        spell = true,
        vsnip = true,
        ultisnips = true,
        nvim_lua = true,
        -- disabled
        tags = false,
        treesitter = false,
        omni = false,
    }

}

local npairs = require('nvim-autopairs')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif vim.fn.call("UltiSnips#CanJumpForwards") == 1 then
        return t "Ultisnips#JumpForwards"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    elseif vim.fn.call("UltiSnips#CanJumpBackwards") == 1 then
        return t "UltiSnips#JumpBackwards"
    else
        return t "<S-Tab>"
    end
end




vim.g.completion_confirm_key = ""
_G.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completion_confirm()", {expr = true, noremap=true})


local Rule = require('nvim-autopairs.rule')

