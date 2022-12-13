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

bind_key({ "n", "v" }, "<Leader>h", function ()
	require("hop").hint_patterns({}, "\\k\\+\\|.$")
end)

bind_key("n", "<Leader>db", function ()
	require("dap").toggle_breakpoint()
end)

bind_key("n", "<Leader>dd", function ()
	require("dap").continue()
end)

bind_key("n", "<Leader>dh", function ()
	require("dap").step_out()
end)

bind_key("n", "<Leader>dj", function ()
	require("dap").step_over()
end)

bind_key("n", "<Leader>dk", function ()
	require("dap").run_last()
end)

bind_key("n", "<Leader>dl", function ()
	require("dap").step_into()
end)

bind_key("n", "<Leader>dm", function ()
	require("dapui").float_element()
end)

bind_key("n", "<Leader>dx", function ()
	require("dap").terminate()
end)

bind_key("n", "<Leader>gd", "<Cmd>Gitsigns preview_hunk<CR>")
bind_key("n", "<Leader>gr", "<Cmd>Gitsigns reset_hunk<CR>")

bind_key("n", "<Leader>la", function ()
	vim.lsp.buf.code_action()
end)

bind_key("n", "<Leader>ld", function ()
	vim.diagnostic.open_float({ border = "rounded" })
end)

bind_key("n", "<Leader>lh", function ()
	vim.lsp.buf.hover()
end)

bind_key("n", "<Leader>ll", "<Cmd>LspRestart<CR>")

bind_key("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>")
bind_key("n", "<Leader>tl", "<Cmd>Telescope live_grep<CR>")
