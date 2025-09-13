return {
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewFileHistory",
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup({
                enhanced_diff_hl = true,
                view = {
                    default = {
                        layout = "diff2_horizontal",
                    },
                },
                file_panel = {
                    listing_style = "tree",
                    win_config = {
                        position = "right",
                        width = 35,
                    },
                },
            })
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("gitsigns").setup {
                numhl = true, -- highlight line numbers for changed lines
                linehl = false, -- highlight entire lines
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true
                },
                current_line_blame = true, -- show git blame for current line
                sign_priority = 6,
            }
        end
    }
}
