local registry = require("mason-registry")
local vls_path = registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"

return {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vls_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
