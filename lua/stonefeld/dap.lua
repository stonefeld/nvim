-- ---------- Dap ---------- --
local status_dap, dap = pcall(require, "dap")
if not status_dap then
	return
end

-- configure lldb adapter
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

-- configure dap for c/c++/rust
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

-- use the same configurations from cpp for c and rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- add some nice ui to dap with dapui
local status_dapui, dapui = pcall(require, "dapui")
if status_dapui then
	dapui.setup({
		icons = { expanded = "▾", collapsed = "▸" },
		mappings = {
			expand = "<cr>",
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		expand_lines = vim.fn.has("nvim-0.7"),
		layouts = {
			{
				elements = { "stacks", "breakpoints" },
				size = 40,
				position = "right",
			},
			{
				elements = { "scopes", "watches" },
				size = 40,
				position = "left",
			},
			{
				elements = { "repl" },
				size = 15,
				position = "bottom",
			},
		},
		floating = {
			max_height = nil,
			max_width = nil,
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 0 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
		},
	})

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end
