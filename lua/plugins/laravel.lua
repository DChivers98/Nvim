return {
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio",
        },
        ft = { "php", "blade" },
        event = {
            "BufEnter composer.json",
        },
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
                "<c-g>",
                function()
                    Laravel.commands.run("view:finder")
                end,
                desc = "Open View Finder",
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
                "gf",
                function()
                    local ok, res = pcall(function()
                        if Laravel.app("gf").cursorOnResource() then
                            return "<cmd>lua Laravel.commands.run('gf')<cr>"
                        end
                    end)
                    if not ok or not res then
                        return "gf"
                    end
                    return res
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
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        ft = { "blade", "php" },
    },
    {
        "jwalton512/vim-blade",
    },
}
