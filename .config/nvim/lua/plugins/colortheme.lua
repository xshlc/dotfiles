return {
    'luisiacc/gruvbox-baby',
    branch = 'main', -- Corrected syntax
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.gruvbox_baby_background_color = 'dark' -- dark or medium
        vim.g.gruvbox_baby_transparent_mode = false
        vim.g.gruvbox_baby_comment_style = 'bold'

        -- vim.g.gruvbox_baby_keyword_style = "italic"

        -- Load the colorscheme
        vim.cmd [[colorscheme gruvbox-baby]]

        -- Toggle background transparency
        local toggle_transparency = function()
            bg_transparent = not bg_transparent
            vim.g.gruvbox_baby_transparent_mode = bg_transparent
            vim.cmd [[colorscheme gruvbox-baby]]
        end

        -- Map a key to the toggle background transparency
        vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end,
}
