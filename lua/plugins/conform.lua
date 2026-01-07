return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                php = { "pint" },
                blade = { "blade-formatter" },
            },
            formatters = {
                pint = {
                    command = "./vendor/bin/pint",
                    args = { "$FILENAME" },
                    stdin = false,
                },
                blade_formatter = {
                    command = "blade-formatter",
                    args = { "--stdin" },
                    stdin = true,
                },
            },
        },
    },
}
