local function bind_key(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs)
end

local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

vim.g.mapleader = " "

bind_key("n", "<Leader>w", "<Cmd>winc w<CR>")

bind_key("n", "<Leader>c", function ()
	require("Comment.api").toggle.linewise.current()
end)

bind_key("v", "<Leader>c", function ()
	vim.api.nvim_feedkeys(esc, "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end)

bind_key("n", "<Leader>gd", "<Cmd>Gitsigns preview_hunk<CR>")
bind_key("n", "<Leader>gr", "<Cmd>Gitsigns reset_hunk<CR>")

bind_key({ "n", "v" }, "<Leader>h", function ()
	require("hop").hint_words()
end)

bind_key("n", "<Leader>a", function ()
	vim.lsp.buf.code_action()
end)

bind_key("n", "<Leader>d", function ()
	vim.diagnostic.open_float()
end)

bind_key("n", "<Leader>i", function ()
	vim.lsp.buf.hover()
end)

bind_key("n", "<Leader>l", "<Cmd>LspRestart<CR>")

bind_key("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>")
bind_key("n", "<Leader>tl", "<Cmd>Telescope live_grep<CR>")
