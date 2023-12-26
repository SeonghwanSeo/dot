local Util = require("lazyvim.util")
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pylsp = {
        root_dir = Util.root.get,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "E501", "W503", "W605", "E402" },
              },
              pyflakes = { enabled = false },
              mccabe = { enabled = false },
            },
          },
        },
      },
    },
  },
}
