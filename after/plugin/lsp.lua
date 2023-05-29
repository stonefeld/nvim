-- lsp setup with lsp-zero
local lz_ok, lz = pcall(require, "lsp-zero")
if not lz_ok then
  return
end

-- use the 'recommended' preset with some adjustments
lz.preset({
  name = "recommended",
  set_lsp_keymaps = false,
  manage_nvim_cmp = {
    set_extra_mappings = false,
    documentation_window = false,
  },
})

-- set the lsp sign incons
lz.set_sign_icons({
  error = "",
  warn = "",
  hint = "",
  info = "",
})

-- this servers should be installed
local lsp_servers = {
  "clangd",
  "pylsp",
  "lua_ls",
}
lz.ensure_installed(lsp_servers)
for _, server in pairs(lsp_servers) do
  local server_opts_ok, server_opts = pcall(require, "stonefeld.lsp." .. server)
  if server_opts_ok then
    lz.configure(server, server_opts)
  end
end

-- when a buffer with some lsp gets attached, set the following mappings
lz.on_attach(function(_, bufnr)
  lz.default_keymaps({ buffer = bufnr })
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, remap = false })
end)

-- finish setting up lsp
lz.setup()

-- setting up cmp
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  cmp.setup({
    mapping = {
      ["<C-l>"] = lz.cmp_action().luasnip_jump_forward(),
      ["<C-h>"] = lz.cmp_action().luasnip_jump_backward(),
    },
  })
end

-- formatting with null-ls
local fmt_ok, fmt = pcall(require, "null-ls")
if fmt_ok then
  local builtins = fmt.builtins.formatting
  fmt.setup({
    sources = {
      builtins.isort,
      builtins.black,
      builtins.prettier,
      builtins.stylua,
    },
  })

  local formatting = vim.api.nvim_create_augroup("null-ls-formatting", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = formatting,
    pattern = { "*.c", "*.h", "*.js*", "*.lua", "*.py", "*.rs", "*.ts*" },
    command = [[ lua vim.lsp.buf.format() ]],
  })
end
