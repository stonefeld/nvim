return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc or "" })
        end

        map("gd", vim.lsp.buf.definition, "[LSP] Goto Definition")
        map("gD", vim.lsp.buf.declaration, "[LSP] Goto Declaration")
        map("gI", vim.lsp.buf.implementation, "[LSP] Goto Implementation")
        map("gr", vim.lsp.buf.references, "[LSP] Goto Implementation")

        map("<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "[LSP] Code Action")

        map("K", vim.lsp.buf.hover, "[LSP] Kind (Hover documentation)")
      end,
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({ virtual_text = false })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      clangd = {
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
        },
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "E501", "W391", "W503", "W504", "W291", "W293" },
                maxLineLength = 120,
              },
            },
          },
        },
      },
      tsserver = {},
      eslint = {},
      html = {
        filetypes = { "html", "htmldjango" },
      },
      cssls = {},
      emmet_ls = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "clang-format",
      "black",
      "isort",
      "prettierd",
    })

    require("mason").setup()
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
