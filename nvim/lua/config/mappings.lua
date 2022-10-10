local function bind_key(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

vim.g.mapleader = " "

bind_key("n", "<Leader>w", ":wincmd w<CR>")

bind_key("n", "<Leader>c", ":lua require('Comment.api').toggle.linewise.current()<CR>")
bind_key("v","<Leader>c", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

bind_key("n", "<Leader>gd", ":Gitsigns preview_hunk<CR>")
bind_key("n", "<Leader>gr", ":Gitsigns reset_hunk<CR>")

bind_key("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>")
bind_key("n", "<Leader>h", ":lua vim.lsp.buf.hover()<CR>")
bind_key("n", "<Leader>l", ":LspRestart<CR>")

bind_key("n", "<Leader>tf", ":Telescope find_files<CR>")
bind_key("n", "<Leader>tl", ":Telescope live_grep<CR>")
