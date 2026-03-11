-- Optimized keymaps with conflict resolution
vim.keymap.set("n", ";", ":", { noremap = true, silent = true })

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Better navigation
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard management
vim.keymap.set("x", "<leader>p", [["_dP]])  -- Paste without yanking
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])  -- Yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])  -- Delete without yanking

-- Quality of life
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

-- Tmux integration (using leader prefix to avoid conflicts)
vim.keymap.set("n", "<leader>ts", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- LSP actions (using conform for formatting)
vim.keymap.set("n", "<leader>lf", function()
    require("conform").format({ async = true })
end, { desc = "Format" })

-- Quickfix navigation (standard vim convention)
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- Location list navigation (using Ctrl+Alt to avoid conflicts)
vim.keymap.set("n", "<C-M-j>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<C-M-k>", "<cmd>lprev<CR>zz")

-- Search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
