return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- File management (unchanged)
        vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end, { desc = "Harpoon prepend" })
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

        -- Navigation: leader+number = go to slot (no Alt - works with AeroSpace leader)
        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon go 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon go 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon go 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon go 4" })

        -- Replace at position: leader+R then 1–4 (R = replace)
        vim.keymap.set("n", "<leader>R1", function() harpoon:list():replace_at(1) end, { desc = "Harpoon replace 1" })
        vim.keymap.set("n", "<leader>R2", function() harpoon:list():replace_at(2) end, { desc = "Harpoon replace 2" })
        vim.keymap.set("n", "<leader>R3", function() harpoon:list():replace_at(3) end, { desc = "Harpoon replace 3" })
        vim.keymap.set("n", "<leader>R4", function() harpoon:list():replace_at(4) end, { desc = "Harpoon replace 4" })
    end
}
