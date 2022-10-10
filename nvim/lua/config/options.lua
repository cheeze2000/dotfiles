vim.opt.cursorline = true
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.wrap = false

vim.opt.listchars:append({
	extends = "→",
	lead = "·",
	precedes = "←",
	tab = "│ ",
	trail = "·",
})

vim.g.python_recommended_style = 0
