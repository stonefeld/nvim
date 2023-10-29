return {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "pylsp",
        "lua_ls",
        "tsserver",
        "html",
        "cssls",
        "emmet_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "black",
        "isort",
        "prettier",
        "stylua",
      },
    })

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

      vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local config = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    mason_lspconfig.setup_handlers({
      function(server)
        local ok, settings = pcall(require, "stonefeld.plugins.lsp.servers." .. server)
        if ok then
          config = vim.tbl_deep_extend("force", config, settings)
        end
        require("lspconfig")[server].setup(config)
      end,
    })
  end,
}
