local dap = require("dap")
local dapui = require("dapui")

dap.adapters.lldb = {
	type = "executable",
	command = "lldb-vscode",
	name = "lldb",
}

dap.configurations.d = {
	{
		name = "Launch LLDB",
		type = "lldb",
		request = "launch",
		program = function ()
			local cwd = vim.fn.getcwd()
			local name = vim.fn.fnamemodify(cwd, ":t")
			return cwd .. "/" .. name
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dapui.setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	layouts = {
		{
			elements = { "scopes" },
			size = 30,
			position = "right",
		},
	},
	floating = {
		border = "rounded",
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function ()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function ()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function ()
	dapui.close()
end

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "ErrorMsg",
})

vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "Comment",
})

vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "WarningMsg",
})
