return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            opts = {
                custom_calculation = function(_, language_tree)
                    if
                        vim.bo.filetype == "blade"
                        and language_tree._lang ~= "javascript"
                        and language_tree._lang ~= "php"
                    then
                        return "{{-- %s --}}"
                    end
                end,
            },
        },
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        parser_install_info = {
            blade = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
                generate_requires_npm = true,
                requires_generate_from_grammar = true,
            },
        },
    },
}
