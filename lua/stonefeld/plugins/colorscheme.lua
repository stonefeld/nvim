return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            local gruvbox = require("gruvbox")

            gruvbox.setup({
                italic = {
                    strings = false,
                    comments = false,
                    folds = false,
                },
            })
            vim.cmd([[ colorscheme gruvbox ]])
        end
    }
}
