local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    root_dir = vim.loop.cwd,
    sources = {
        formatting.prettier,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(c)
                            return c.name == "null-ls"
                        end,
                        timeout_ms = 2000,
                    })
                end,
            })
        end
    end,
})
