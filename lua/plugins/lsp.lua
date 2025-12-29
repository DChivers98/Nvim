return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                phpactor = {
                    filetypes = { "php", "blade", "php_only" },
                    settings = {
                        phpactor = {
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
            },
        },
    },
}
