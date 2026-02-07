return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ts_ls = {
                    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                    init_options = {
                        plugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = vim.fn.stdpath("data")
                                    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                                languages = { "vue" },
                            },
                        },
                    },
                },
                intelephense = {
                    filetypes = { "php", "blade", "php_only" },
                    settings = {
                        intelephense = {
                            index = {
                                enabled = true,
                                scanFolders = {
                                    "app",
                                    "src",
                                    "vendor",
                                    "_ide_helper.php",
                                    "_ide_helper_models.php",
                                },
                            },
                        },
                    },
                },
                html = {
                    filetypes = { "html", "blade" },
                    init_options = {
                        configurationSection = { "html", "css", "javascript" },
                        embeddedLanguages = { css = true, javascript = true },
                        provideFormatter = true,
                    },
                },
            },
        },
    },
}
