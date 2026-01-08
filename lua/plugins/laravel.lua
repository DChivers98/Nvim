return {
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio",
            "folke/snacks.nvim",
            "nvim-telescope/telescope.nvim",
        },
        ft = { "php", "blade" },
        event = { "VeryLazy" },
        cmd = { "Laravel" },
        keys = {
            { "<leader>cl", desc = "Laravel" },
            {
                "<leader>cll",
                function()
                    Laravel.pickers.laravel()
                end,
                desc = "Open Laravel Picker",
            },
            {
                "<leader>cla",
                function()
                    Laravel.pickers.artisan()
                end,
                desc = "Open Artisan Picker",
            },
            {
                "<leader>clt",
                function()
                    Laravel.commands.run("actions")
                end,
                desc = "Open Actions Picker",
            },
            {
                "<leader>clr",
                function()
                    Laravel.pickers.routes()
                end,
                desc = "Open Routes Picker",
            },
            {
                "<leader>cld",
                function()
                    Laravel.run("artisan docs")
                end,
                desc = "Open Documentation",
            },
            {
                "<leader>clm",
                function()
                    Laravel.pickers.make()
                end,
                desc = "Open Make Picker",
            },
            {
                "<leader>clc",
                function()
                    Laravel.pickers.commands()
                end,
                desc = "Open Commands Picker",
            },
            {
                "<leader>clo",
                function()
                    Laravel.pickers.resources()
                end,
                desc = "Open Resources Picker",
            },
            {
                "<leader>clp",
                function()
                    Laravel.commands.run("command_center")
                end,
                desc = "Open Command Center",
            },
            {
                "<c-g>",
                function()
                    Laravel.commands.run("view:finder")
                end,
                desc = "Open View Finder",
            },
            {
                "gf",
                function()
                    local gf_app = Laravel.app("gf")
                    if gf_app and gf_app.cursorOnResource and gf_app.cursorOnResource() then
                        return "<cmd>Laravel commands run gf<cr>"
                    end
                    return "gf"
                end,
                expr = true,
                noremap = true,
            },
        },
        opts = {
            features = {
                pickers = {
                    provider = "snacks",
                },
            },
        },
    },
    {
        "ricardoramirezr/blade-nav.nvim",
        dependencies = { "hrsh7th/nvim-cmp" },
        ft = { "blade", "php" },
    },
}
