-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save buffer
keymap("n", "fs", ":w<CR>", opts)

-- Better line start/end
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Better escape
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<ESC>", "<ESC>:noh<CR>", opts)

local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "<leader>fd", function()
    Util.float_term(
        { "lazydocker", "-f", Util.get_root() .. "docker-compose.yml" },
        { cwd = Util.get_root(), esc_esc = false }
    )
end, { desc = "LazyDocker (root dir)" })
