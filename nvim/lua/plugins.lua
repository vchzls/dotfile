local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim --depth=1 " .. install_path)
    execute "packadd packer.nvim"
end


return require('packer').startup({function()

    -- packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim'}

    -- brackets maps
    -- use 'tpope/vim-unimpaired'

    -- lsp
    use {"neovim/nvim-lspconfig"}
    use {"glepnir/lspsaga.nvim", config='require("lsp.saga")'}
    use {"kabouzeid/nvim-lspinstall"}

    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- autocomplete
    use {"hrsh7th/vim-vsnip"}
    use {"rafamadriz/friendly-snippets"}
    use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}
    use {'sillybun/zyt-snippet'}
    -- TODO
    -- use {"windwp/nvim-autopairs", config='require("plugin_settings.autopairs")'}
    use {"windwp/nvim-autopairs", config='require("nvim-autopairs").setup()'}
    use {
        'hrsh7th/nvim-compe',
        config = 'require("plugin_settings.compe")'
    }


    -- TODO
    use 'kevinhwang91/nvim-bqf'

    -- colorscheme
    use {"arcticicestudio/nord-vim", opt=true}
    use {"rakr/vim-one", opt=true}
    use {"joshdick/onedark.vim", opt=true}

    -- debugging
    use {
        'mfussenegger/nvim-dap',
        config = 'require("plugin_settings.dap")',
    }
    -- use {
    --     'JoshMcguigan/estream',
    --     run = 'bash install.sh v0.2.0',
    -- }
    --
    -- git
    use {"lewis6991/gitsigns.nvim",
        requires = {'nvim-lua/plenary.nvim'},
        config = 'require("plugin_settings.gitsigns")'}

    -- vista
    -- use {
    --     'liuchengxu/vista.vim',
    --     config = 'require("plugin_settings.vista")',
    -- }

    -- text objects
    -- use {
    --     'kana/vim-textobj-user',
    --     'kana/vim-textobj-entire',
    --     'michaeljsmith/vim-indent-object',
    --     'kana/vim-textobj-syntax',
    --     'sgur/vim-textobj-parameter',
    -- }

    -- surround braces
    --use {
    --    'machakann/vim-sandwich',
    --    'tpope/vim-repeat',
    --}

    -- search highlight
    -- use 'timakro/vim-searchant'

    -- traces
    -- use 'markonm/traces.vim'
    -- use {
    --     'monaqa/dial.nvim',
    --     config = 'require("plugin_settings.dial")',
    -- }

    -- -- highlight
    -- use {
    --     'machakann/vim-highlightedyank',
    --     config = 'vim.g.highlightedyank_highlight_duration = 300',
    -- }
    -- use {
    --     'norcalli/nvim-colorizer.lua',
    --     config = 'require("colorizer").setup{}',
    -- }
    --
    -- -- focus
    -- use {
    --     'junegunn/goyo.vim',
    --     requires = {'junegunn/limelight.vim', config = 'require("plugin_settings.limelight")'},
    --     config = 'require("plugin_settings.goyo")',
    -- }
    -- use {
    --     'karb94/neoscroll.nvim',
    --     config = 'require("neoscroll").setup()',
    -- }
    -- use {
    --     'phaazon/hop.nvim',
    --     config = 'require("plugin_settings.hop")',
    -- }

    -- -- capword
    -- use 'AckslD/vim-capword'
    -- use 'AckslD/vim-sisr' -- SISR

    --  Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}, -- for file icons
        config = 'require("plugin_settings.tree")',
    }

    -- terminal
    use 'skywind3000/vim-terminal-help'
    use 'skywind3000/asynctasks.vim'
    use 'skywind3000/asyncrun.vim'


    -- TODO
    -- use {
    --     'nvim-lua/plenary.nvim',
    --     config = 'require("plugin_settings.plenary")',
    -- }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = 'require("plugin_settings.telescope")',
    }

    -- comment
    use {"terrortylor/nvim-comment", config='require("plugin_settings.comment")'}

    -- statusline
    use {"glepnir/galaxyline.nvim", config='require("plugin_settings.galaxyline")'}
    use {"romgrk/barbar.nvim"}
    use {'glepnir/dashboard-nvim', config='require("plugin_settings.dashboard")'}

    use {
        'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key', config='require("plugin_settings.whichkey")'},
    }

    -- markdown
    use {
        {'SidOfc/mkdx', config='require("plugin_settings.mkdx")', ft={'markdown', 'md'}},
        -- preview
        {'iamcco/markdown-preview.nvim', run = vim.fn['mkdp#util#install'], ft = {'markdown', 'md'}},
        -- ft = {'markdown'},
    }
    -- Latex
    use {
        'lervag/vimtex',
        config = 'require("plugin_settings.vimtex")',
        ft = {'tex'},
    }


end, config = {
    display = {
        open_fn = require('packer.util').float,
  },
  git = {
      cmd='git', depth=1, clone_timeout=6000,
  }
}})
