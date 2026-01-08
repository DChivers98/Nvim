return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    opts = function()
        vim.opt.termguicolors = true
        local pink = "#e6a8c9"

        -- Highlight groups for cmp menu and icons
        vim.api.nvim_set_hl(0, "CmpBorder", { fg = pink, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        vim.api.nvim_set_hl(0, "CmpKind", { fg = pink }) -- All icons pink

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "CmpBorder", { fg = pink, bg = "NONE" })
                vim.api.nvim_set_hl(0, "CmpNormal", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "CmpKind", { fg = pink })
            end,
        })

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local defaults = require("cmp.config.default")()

        return {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                    padding = { 0, 1 },

                    winblend = 0,

                    winhighlight = table.concat({
                        "Normal:CmpNormal",
                        "CursorLine:PmenuSel",
                        "FloatBorder:PmenuBorder",
                    }, ","),
                }),

                documentation = cmp.config.window.bordered({
                    border = "rounded",
                    side = "right",
                    padding = { 0, 1 },

                    winblend = 0,

                    winhighlight = table.concat({
                        "Normal:NormalFloat",
                        "FloatBorder:PmenuBorder",
                    }, ","),
                }),
            },

            view = {
                docs = {
                    auto_open = false,
                },
            },

            completion = { completeopt = "menu,menuone,noinsert" },

            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping(function(fallback)
                    if cmp.visible_docs() then
                        cmp.scroll_docs(4)
                    elseif cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-k>"] = cmp.mapping(function(fallback)
                    if cmp.visible_docs() then
                        cmp.scroll_docs(-4)
                    elseif cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-d>"] = cmp.mapping(function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end),

                ["<Space>"] = cmp.mapping.confirm({ select = true }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),

            sources = cmp.config.sources({
                { name = "laravel", priority = 1000 },
                {
                    name = "nvim_lsp",
                    priority = 900,
                    option = {
                        completion = { keyword_length = 2 },
                    },
                },
                { name = "luasnip", priority = 800 },
                { name = "path", priority = 500 },
                { name = "buffer", priority = 100 },
            }),

            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    before = function(entry, vim_item)
                        vim_item.kind_hl_group = "CmpKind"

                        vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)

                        return vim_item
                    end,
                }),
            },

            experimental = {
                ghost_text = { hl_group = "CmpGhostText" },
            },

            sorting = defaults.sorting,
        }
    end,
}
