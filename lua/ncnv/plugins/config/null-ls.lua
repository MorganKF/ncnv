local present, null_ls = pcall(require, 'null-ls')

if not present then
    return
end

local augroup = vim.api.nvim_create_augroup('LspFormat', {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.eslint_d.with({
            extra_filetypes = { 'svelte' },
        }),
        null_ls.builtins.diagnostics.eslint_d.with({
            extra_filetypes = { 'svelte' },
        }),
        null_ls.builtins.formatting.eslint_d.with({
            extra_filetypes = { 'svelte' },
        }),
        null_ls.builtins.formatting.prettierd.with({
            extra_filetypes = { 'svelte' },
        }),
    },
    on_attach = function(lsp_client, bufnr)
        if lsp_client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(client)
                            return client.name == 'null-ls'
                        end,
                    })
                end,
            })
        end
    end,
})
