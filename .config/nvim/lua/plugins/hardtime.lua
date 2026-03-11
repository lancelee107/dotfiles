return {
    "takac/vim-hardtime",
    event = "VimEnter",
    config = function()
        vim.g.hardtime_default_on = 1
        vim.g.hardtime_showmsg = 0
        vim.g.hardtime_timeout = 1000
        vim.g.hardtime_maxcount = 1
        vim.g.hardtime_allow_different_key = 1  -- allow "jh" but not "jj"
    end,
}
