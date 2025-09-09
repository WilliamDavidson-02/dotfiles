return {
    -- Comment plugin
    {
        'numToStr/Comment.nvim',
    },

    -- Mason core
    {
        "mason-org/mason.nvim",
        config = true,
    },

    -- Mason LSP bridge
    {
        "williamboman/mason-lspconfig.nvim",
        config = true,
        dependencies = { "mason-org/mason.nvim" },
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- TypeScript / JavaScript LSP
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    -- disable ts_ls formatting to avoid conflict with none-ls
                    client.server_capabilities.documentFormattingProvider = false

                    local opts = { buffer = bufnr, desc = "LSP Hover" }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })
        end,
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
    },

    -- none-ls for format-on-save
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.none-ls")
        end,
    },

}
