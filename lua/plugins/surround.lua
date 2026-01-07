return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            surrounds = {
                ["D"] = {
                    add = { "<div>", "</div>" },
                },
            },
            keymaps = {
                normal = "ys",
                normal_cur = "yssiw",
                normal_line = "yS",
            },
        })
    end,
}
