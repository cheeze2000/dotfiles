require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

lspconfig.eslint.setup({})
lspconfig.hls.setup({})
lspconfig.intelephense.setup({})
lspconfig.pyright.setup({})
lspconfig.sumneko_lua.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.tsserver.setup({})
lspconfig.volar.setup({})
