-- ---------- LuaSnip ---------- --
-- Make protected call to require luasnip sources
local stauts_ok, ls = pcall(require, "luasnip.loaders.from_vscode")
if not stauts_ok then
  return
end

ls.lazy_load()
