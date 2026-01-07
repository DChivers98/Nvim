vim.filetype.add({ pattern = { [".*%.blade%.php"] = "blade" } })

local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = "*.blade.php",
    callback = function()
        vim.bo.filetype = "php"
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*.blade.php",
    callback = function(args)
        vim.schedule(function()
            local clients = vim.lsp.get_clients({ bufnr = args.buf })
            for _, client in ipairs(clients) do
                if client.name == "phpactor" then
                    vim.bo[args.buf].filetype = "blade"
                    break
                end
            end
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = { "php", "blade" },
    callback = function()
        vim.opt_local.iskeyword:append("$")
    end,
})
