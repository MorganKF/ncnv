return {
    'nvim-neo-tree/neo-tree.nvim',
    keys = {
        {
            '<leader>fe',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    dir = require('lazyvim.util').root.get(),
                    position = 'current',
                    reveal = true,
                })
            end,
            desc = 'Explorer NeoTree (root dir)',
        },
        {
            '<leader>fE',
            function()
                require('neo-tree.command').execute({
                    toggle = true,
                    dir = vim.loop.cwd(),
                    position = 'current',
                    reveal = true,
                })
            end,
            desc = 'Explorer NeoTree (cwd)',
        },
        { '<leader>e', '<leader>fe', desc = 'Explorer NeoTree (root dir)', remap = true },
        { '<leader>E', '<leader>fE', desc = 'Explorer NeoTree (cwd)', remap = true },
    },
}
