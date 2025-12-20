return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                php = { "pint" },
            },
            formatters = {
                pint = {
                    command = "./vendor/bin/pint",
                    args = { "$FILENAME" },
                    stdin = false,
                },
            },
        },
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            opts.sources = opts.sources or {}

            -- Filter out any PHP formatters from none-ls
            opts.sources = vim.tbl_filter(function(source)
                return not (source.filetypes and vim.tbl_contains(source.filetypes, "php"))
            end, opts.sources)
        end,
    },
}
