-- lsp setup with lsp-zero
local lz_ok, lz = pcall(require, "lsp-zero")
if not lz_ok then
  return
end

lz.preset("recommended")

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

lz.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = "",
  },
})

lz.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

  local nv_ok, nv = pcall(require, "nvim-navic")
  if nv_ok then
    nv.attach(client, bufnr)
  end
end)

local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  local sel_opt = { behavior = cmp.SelectBehavior.Select }
  local cmp_remap = {
    ["<C-n>"] = cmp.mapping.select_next_item(sel_opt),
    ["<C-p>"] = cmp.mapping.select_prev_item(sel_opt),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),
  }

  local ls_ok, ls = pcall(require, "luasnip")
  if ls_ok then
    cmp_remap["<C-l>"] = cmp.mapping(function(fallback)
      if ls.jumpable(1) then
        ls.jump(1)
      else
        fallback()
      end
    end, { "i", "s" })

    cmp_remap["<C-h>"] = cmp.mapping(function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
  end

  local cmp_setup = {
    mapping = cmp_remap,
    sources = {
      { name = "nvim_lsp", keyword_length = 1 },
      { name = "luasnip" },
      { name = "buffer", keyword_length = 3 },
      { name = "path" },
    },
  }

  lz.setup_nvim_cmp(cmp_setup)
end

lz.setup()

-- formatting with null-ls
local fmt_ok, fmt = pcall(require, "null-ls")
if not fmt_ok then
  return
end

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
  pattern = { "*.js*", "*.lua", "*.py", "*.rs", "*.ts*" },
  command = [[ lua vim.lsp.buf.format() ]],
})
