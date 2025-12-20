return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        config = function()
            local catppuccin = require("catppuccin")
            catppuccin.setup({
                flavour = "frappe",
                integrations = {
                    treesitter = true,
                    cmp = true,
                    lsp_trouble = true,
                    telescope = true,
                    which_key = false,
                },
            })

            vim.cmd.colorscheme("catppuccin")

            local beige = "#ede1d1"
            local pink = "#e6a8c9"
            local gray = "#a5adce"
            local frappe_bg = "#303446"

            local function hl(name, opts)
                vim.api.nvim_set_hl(0, name, opts)
            end

            local border_groups = {
                "FloatBorder",
                "LspHoverBorder",
                "LspInfoBorder",
                "TelescopeBorder",
                "WhichKeyFloatBorder",
                "NoicePopupBorder",
                "NoiceCmdlinePopupBorder",
                "CmdlineBorder",
            }
            for _, g in ipairs(border_groups) do
                hl(g, { fg = pink, bg = frappe_bg })
            end

            local float_text_groups = {
                "NormalFloat",
                "LspHoverNormal",
                "LspInfoNormal",
                "TelescopeNormal",
                "WhichKeyFloat",
                "WhichKey",
                "WhichKeyGroup",
                "WhichKeyDesc",
                "NotifyBackground",
                "NoicePopup",
                "NoiceCmdlinePopup",
            }
            for _, g in ipairs(float_text_groups) do
                hl(g, { bg = frappe_bg, fg = gray })
            end

            -- CMP popup
            hl("Pmenu", { bg = frappe_bg, fg = beige })
            hl("PmenuSel", { bg = pink, fg = frappe_bg })
            hl("PmenuThumb", { bg = pink })
            hl("PmenuSbar", { bg = frappe_bg })

            -- Strings
            hl("String", { fg = beige })
            hl("@string", { fg = beige })

            -- Classes and namespaces
            hl("@type", { fg = pink })
            hl("@type.builtin", { fg = pink })
            hl("@namespace", { fg = pink })
            hl("@type.qualifier", { fg = pink })
            hl("@constructor", { fg = pink })
            hl("@module", { fg = pink })
            hl("@lsp.type.class", { fg = pink })
            hl("@lsp.type.namespace", { fg = pink })
            hl("@lsp.type.type", { fg = pink })
            hl("@lsp.type.module", { fg = pink })

            -- Command line & messages
            hl("Cmdline", { fg = pink, bg = frappe_bg })
            hl("MsgArea", { fg = pink, bg = frappe_bg })
            hl("MsgSeparator", { fg = pink, bg = frappe_bg })
            hl("ErrorMsg", { fg = pink, bg = frappe_bg, bold = true })
            hl("WarningMsg", { fg = pink, bg = frappe_bg, bold = true })

            -- Noice messages
            hl("NoiceError", { fg = pink, bg = frappe_bg, bold = true })
            hl("NoiceWarn", { fg = pink, bg = frappe_bg, bold = true })
            hl("NoiceInfo", { fg = pink, bg = frappe_bg })
            hl("NoiceCmdlinePopupTitle", { fg = pink, bg = frappe_bg })
            hl("NoiceHistory", { fg = beige, bg = frappe_bg })
            hl("NoicePopupMenu", { fg = beige, bg = frappe_bg })

            -- LSP info
            hl("LspInfoFiletype", { fg = pink, bg = frappe_bg })
            hl("LspInfoTitle", { fg = pink, bg = frappe_bg, bold = true })
            hl("LspInfoKeybind", { fg = beige, bg = frappe_bg })

            -- Dashboard
            hl("SnacksDashboardDesc", { fg = gray })
            hl("SnacksDashboardKey", { fg = gray })
            hl("SnacksDashboardIcon", { fg = gray })
            hl("SnacksDashboardHeader", { fg = pink })
            hl("SnacksDashboardTitle", { fg = pink })
            hl("SnacksDashboardFooter", { fg = gray })

            hl("Directory", { fg = gray })
            hl("SnacksPickerIcon", { fg = pink })
            hl("SnacksPickerIconDirectory", { fg = pink })

            -- Yank highlight
            hl("YankHighlight", { bg = pink, fg = frappe_bg })
            vim.api.nvim_create_autocmd("TextYankPost", {
                callback = function()
                    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 150 })
                end,
            })

            -- CMP setup
            local cmp = require("cmp")
            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder",
                        winblend = 0,
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                        winblend = 0,
                    }),
                },
            })

            -- LSP floating preview
            local orig_open = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "rounded"
                local bufnr, winnr = orig_open(contents, syntax, opts, ...)
                hl("FloatBorder", { fg = pink, bg = frappe_bg })
                hl("NormalFloat", { fg = beige, bg = frappe_bg })
                return bufnr, winnr
            end

            -- Lualine
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    component_separators = { left = "│", right = "│" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { { "mode", color = { fg = pink, bg = frappe_bg, gui = "bold" } } },
                    lualine_b = {
                        { "branch", color = { fg = pink, bg = frappe_bg } },
                        { "diff", color = { fg = pink, bg = frappe_bg } },
                    },
                    lualine_c = { { "filename", color = { bg = frappe_bg } } },
                    lualine_x = {
                        { "encoding", color = { fg = pink, bg = frappe_bg } },
                        { "fileformat", color = { fg = pink, bg = frappe_bg } },
                        { "filetype", color = { fg = pink, bg = frappe_bg } },
                    },
                    lualine_y = { { "progress", color = { fg = pink, bg = frappe_bg } } },
                    lualine_z = { { "location", color = { fg = pink, bg = frappe_bg } } },
                },
                inactive_sections = {
                    lualine_c = { { "filename", color = { fg = beige, bg = frappe_bg } } },
                    lualine_x = { { "location", color = { fg = beige, bg = frappe_bg } } },
                },
            })
        end,
    },
    {
        "echasnovski/mini.icons",
        opts = {
            style = "glyph",
        },
        config = function(_, opts)
            require("mini.icons").setup(opts)
            require("mini.icons").mock_nvim_web_devicons()

            local function hl(name, opts)
                vim.api.nvim_set_hl(0, name, opts)
            end

            local pink = "#e6a8c9"

            hl("MiniIconsAzure", { fg = pink })
            hl("MiniIconsBlue", { fg = pink })
            hl("MiniIconsCyan", { fg = pink })
            hl("MiniIconsGreen", { fg = pink })
            hl("MiniIconsGrey", { fg = pink })
            hl("MiniIconsOrange", { fg = pink })
            hl("MiniIconsPurple", { fg = pink })
            hl("MiniIconsRed", { fg = pink })
            hl("MiniIconsYellow", { fg = pink })
        end,
    },
}
