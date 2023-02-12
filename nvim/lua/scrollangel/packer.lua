vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer (Self installation)
    use 'wbthomason/packer.nvim'

    -- Telescope (Fuzzy finder)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Treesitter (Color highlighting for code) 
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-textobjects')

    -- Fugitive (Git)
    use('tpope/vim-fugitive')

    -- Surround (Modify tags easily)
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- LSP Configuration
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            -- Snippet Collection (Optional)
            {'rafamadriz/friendly-snippets'},
        }
    }
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- Lua line (Bottom powerline)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Toggle terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- Zen mode
    use { "folke/zen-mode.nvim" }

    -- HTML
    use('othree/html5.vim')
    use('lumiliet/vim-twig')
    
    -- Wakatime
    use('wakatime/vim-wakatime')

    -- Github copilot
    use('github/copilot.vim')
end)
