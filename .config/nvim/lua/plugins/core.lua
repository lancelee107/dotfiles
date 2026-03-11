return {
    -- Core editing enhancements
    "tpope/vim-surround",
    
    -- Use native comment functionality instead
    -- Comment with gcc (line) or gc (visual selection)
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
}
