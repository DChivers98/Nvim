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
}
