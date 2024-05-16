return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach({
          cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/jdtls" },
          root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]),
          settings = {
            java = {
              format = {
                settings = {
                  profile = "GoogleStyle",
                  url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
                },
              },
            },
          },
        })
      end,
    })
  end,
}
