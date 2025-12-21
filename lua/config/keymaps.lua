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

-- Tab switch buffer
keymap("n", "<leader><Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

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

-- ===========================
-- TEST COMMANDS (Space + T)
-- ===========================
vim.keymap.del("n", "<leader>ta", { silent = true })
vim.keymap.del("n", "<leader>tt", { silent = true })
vim.keymap.del("n", "<leader>tT", { silent = true })
vim.keymap.del("n", "<leader>tr", { silent = true })
vim.keymap.del("n", "<leader>tl", { silent = true })
vim.keymap.del("n", "<leader>ts", { silent = true })
vim.keymap.del("n", "<leader>tS", { silent = true })
vim.keymap.del("n", "<leader>to", { silent = true })
vim.keymap.del("n", "<leader>tO", { silent = true })
vim.keymap.del("n", "<leader>tw", { silent = true })
vim.keymap.del("n", "<leader>td", { silent = true })
keymap("n", "<leader>Ta", "<cmd>lua require('neotest').run.attach()<cr>", { desc = "Attach" })
keymap("n", "<leader>Tt", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Run File" })
keymap("n", "<leader>TT", "<cmd>lua require('neotest').run.run(vim.uv.cwd())<cr>", { desc = "Run All Test Files" })
keymap("n", "<leader>Tr", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run Nearest" })
keymap("n", "<leader>Tl", "<cmd>lua require('neotest').run.run_last()<cr>", { desc = "Run Last" })
keymap("n", "<leader>Ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Toggle Summary" })
keymap("n", "<leader>TS", "<cmd>lua require('neotest').run.stop()<cr>", { desc = "Stop" })
keymap(
    "n",
    "<leader>To",
    "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>",
    { desc = "Show Output" }
)
keymap("n", "<leader>TO", "<cmd>lua require('neotest').output_panel.toggle()<cr>", { desc = "Toggle Output Panel" })
keymap("n", "<leader>Tw", "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>", { desc = "Toggle Watch" })
keymap("n", "<leader>Td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", { desc = "Debug Nearest" })

-- ===========================
-- TAB COMMANDS (Space + t)
-- ===========================
vim.keymap.del("n", "<leader><tab>l", { silent = true })
vim.keymap.del("n", "<leader><tab>o", { silent = true })
vim.keymap.del("n", "<leader><tab>f", { silent = true })
vim.keymap.del("n", "<leader><tab><tab>", { silent = true })
vim.keymap.del("n", "<leader><tab>]", { silent = true })
vim.keymap.del("n", "<leader><tab>[", { silent = true })
vim.keymap.del("n", "<leader><tab>d", { silent = true })
keymap("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
keymap("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
keymap("n", "<leader>t]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader>t[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
