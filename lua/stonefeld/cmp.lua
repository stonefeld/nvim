-- ---------- Cmp ---------- --
-- Make a protected call in case nvim-cmp is not installed
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local status_ok_ls, ls = pcall(require, "luasnip")

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = " ",
  Method = "m ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
}

-- Basic nvim-cmp configuration
cmp.setup {
  preselect = false,
  snippet = {
    expand = function(args)
      if status_ok_ls then
        ls.lsp_expand(args.body)
      end
    end,
  },
  mapping = {
    ["<c-n>"] = cmp.mapping.select_next_item(),
    ["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(3), { "i", "c" }),     -- scroll documentation downwards
    ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-3), { "i", "c" }),    -- scroll documentation upwards
    ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),     -- restart completion
    ["<c-e>"] = cmp.mapping({                                              -- cancel completion
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])       -- enable icons
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  --[[
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  ]]--
}
