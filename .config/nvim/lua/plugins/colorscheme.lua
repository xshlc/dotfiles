return {
    -- Shortened Github URL
    "xero/miasma.nvim",
    lazy = false,  -- set Lazy to false to allow the colorscheme to load immediately
    priority = 1000, -- allows this (the colorscheme) to load in first
    config = function()
        vim.cmd("colorscheme miasma")
    end,
}
