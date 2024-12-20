return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pylsp = {
        mason = false,
        settings = {
          pylsp = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { "*" },
              typeCheckingMode = "off",
            },
          },
        },
      },
      ruff = {
        mason = false,
        settings = {
          logLever = "debug",
        },
      },
    },
  },
}
