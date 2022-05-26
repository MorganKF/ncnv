local present, packer = pcall(require, 'ncnv.plugins.packerinit')

if not present then
    error(packer)
    return false
end

packer.startup(function(use)
    -- Lua function library
    use({ 'nvim-lua/plenary.nvim' })

    -- Benchmarks and caching
    use({ 'lewis6991/impatient.nvim' })

    -- Keeps packer updated
    use({
        'wbthomason/packer.nvim',
        event = 'VimEnter',
    })

    --------
    -- UI --
    --------

    -- Font icons
    use({ 'kyazdani42/nvim-web-devicons' })

    -- GitHub theme
    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                theme_style = 'dark_default',
            })
        end,
    })

    -- Buffer & tabline
    use({
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('ncnv.plugins.config.bufferline')
        end,
    })

    -- Git status & actions
    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    })

    -- Prompt w/ native fzf
    use({
        'nvim-telescope/telescope.nvim',
        config = function()
            require('ncnv.plugins.config.telescope')
        end,
    })

    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        requires = 'nvim-telescope/telescope.nvim',
    })

    -- Draws indent lines
    use({
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
    })

    -- Fast statusline
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('ncnv.plugins.config.lualine')
        end,
    })

    -- Filebrowser
    use({
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('ncnv.plugins.config.nvim-tree')
        end,
        tag = 'nightly',
    })

    -- Improve nvim select and input UI
    use({
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup({})
        end,
    })

    ---------
    -- LSP --
    ---------

    use({
        'williamboman/nvim-lsp-installer',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'folke/lua-dev.nvim',
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
        {
            'neovim/nvim-lspconfig',
            config = function()
                require('ncnv.plugins.config.lspconfig')
            end,
        },
    })

    use({
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim',
        wants = 'lewis6991/gitsigns.nvim',
        config = function()
            require('ncnv.plugins.config.null-ls')
        end,
    })

    use({
        'folke/trouble.nvim',
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('ncnv.plugins.config.trouble')
        end,
    })

    ------------------------
    -- Syntax / Languange --
    ------------------------

    -- Better syntax highlighting
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('ncnv.plugins.config.treesitter')
        end,
    })

    -------------
    -- Utility --
    -------------

    -- Surround replacement & extras
    use({
        'echasnovski/mini.nvim',
        branch = 'stable',
        config = function()
            require('ncnv.plugins.config.mini')
        end,
    })

    --Auto close pairs
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end,
    })

    -- Generate comments
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('ncnv.plugins.config.comment')
        end,
    })

    -- More motions
    use({
        'phaazon/hop.nvim',
        config = function()
            require('ncnv.plugins.config.hop')
        end,
    })

    -- Highlight and search todo comments
    use({
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup({})
        end,
    })
end)
