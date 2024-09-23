return {
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
}
