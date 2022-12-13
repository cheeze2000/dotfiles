require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

local lspconfig = require("lspconfig")

lspconfig.ccls.setup({})
lspconfig.eslint.setup({})
lspconfig.hls.setup({})
lspconfig.intelephense.setup({})
lspconfig.pyright.setup({})
lspconfig.sumneko_lua.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.tsserver.setup({})
lspconfig.volar.setup({})
