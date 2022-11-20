-- ---------- Keymaps ---------- --
-- Default options for keybindings
local opts = { noremap = true, silent = true }

-- Set the leader key to space
vim.g.mapleader = " "

-- Create keymap alias
local key = vim.keymap.set

-- ----- Normal ----- --
-- Open file explorer
key("n", "<leader>e", "<cmd>Explore<cr>", opts)

-- Resize panes
key("n", "<c-left>", "<cmd>vertical resize +5<cr>", opts)
key("n", "<c-right>", "<cmd>vertical resize -5<cr>", opts)
key("n", "<c-up>", "<cmd>resize +1<cr>", opts)
key("n", "<c-down>", "<cmd>resize -1<cr>", opts)

-- Navigating buffers
key("n", "<c-l>", "<cmd>bn<cr>", opts)
key("n", "<c-h>", "<cmd>bp<cr>", opts)
key("n", "<c-k>", "<cmd>bp<cr><cmd>bd #<cr>", opts)

-- Keep the cursor centered on the screen
key("n", "n", "nzzzv", opts)
key("n", "N", "Nzzzv", opts)

-- Telescope
local status_tele, tele = pcall(require, "telescope.builtin")
if status_tele then
	key("n", "<c-p>", tele.find_files, opts)
	key("n", "<leader>fg", tele.live_grep, opts)
	key("n", "<leader>fa", tele.buffers, opts)
end

-- LuaSnip
local status_ls, ls = pcall(require, "luasnip")
if status_ls then
	key({ "i", "s" }, "<c-l>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, opts)
	key({ "i", "s" }, "<c-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, opts)
end

-- Dap
local status_dap, dap = pcall(require, "dap")
if status_dap then
	key("n", "<f5>", dap.continue, opts)
	key("n", "<f6>", dap.terminate, opts)
	key("n", "<f9>", dap.toggle_breakpoint, opts)
	key("n", "<f10>", dap.step_over, opts)
	key("n", "<f11>", dap.step_into, opts)
	key("n", "<f12>", dap.step_out, opts)

	local status_dapui, dapui = pcall(require, "dapui")
	if status_dapui then
		key("n", "<leader>de", dapui.eval, opts)
	end
end

-- ----- Insert ----- --
-- Undo break points
key("i", ",", ",<c-g>u", opts)
key("i", ".", ".<c-g>u", opts)
key("i", "!", "!<c-g>u", opts)
key("i", "?", "?<c-g>u", opts)

-- ----- Visual ----- --
-- Move lines up and down while selected
key("v", "J", ":m '>+1<cr>gv", opts)
key("v", "K", ":m '<-2<cr>gv", opts)

-- Stay in indent mode
key("v", "<", "<gv", opts)
key("v", ">", ">gv", opts)

-- Run figlet on the selected content
key("v", "<leader>ff", ":!figlet<cr>", opts)
