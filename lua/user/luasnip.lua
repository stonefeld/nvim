-- ---------- Luasnip ---------- --
-- Make protected call in case lusnip is not installed
local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
    return
end

-- local types = require "luasnip.util.types"
require("luasnip.loaders.from_vscode").load()

-- Basic configuration
ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
}

-- Expansion key
vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- Backwards key
vim.keymap.set({ "i", "s" }, "<c-h>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- Selecting from list of options
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
