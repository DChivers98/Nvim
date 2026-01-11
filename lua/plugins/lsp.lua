return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
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
                emmet_ls = {
                    filetypes = { "html", "blade", "css", "javascriptreact", "typescriptreact" },
                    init_options = {
                        html = { options = { ["bem.enabled"] = true } },
                        jsx = { options = { ["bem.enabled"] = true } },
                        typescriptreact = { options = { ["bem.enabled"] = true } },
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
