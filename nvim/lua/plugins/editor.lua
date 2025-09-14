return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
        enabled = true,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }

}
