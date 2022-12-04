-- ---------- LuaSnip ---------- --
-- make protected call to require luasnip sources
local stauts_ok, ls = pcall(require, "luasnip.loaders.from_vscode")
if stauts_ok then
	ls.lazy_load()
end
