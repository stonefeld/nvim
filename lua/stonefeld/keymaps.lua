-- ---------- Keymaps ---------- --
-- default options for keybindings
local opts = { noremap = true, silent = true }

-- set the leader key to space
vim.g.mapleader = " "

-- create keymap alias
local key = vim.keymap.set

-- ----- Normal ----- --
-- open file explorer
key("n", "<leader>e", "<cmd>Explore<cr>", opts)

-- resize panes
key("n", "<c-left>", "<cmd>vertical resize +5<cr>", opts)
key("n", "<c-right>", "<cmd>vertical resize -5<cr>", opts)
key("n", "<c-up>", "<cmd>resize +1<cr>", opts)
key("n", "<c-down>", "<cmd>resize -1<cr>", opts)

-- navigating buffers
key("n", "<c-l>", "<cmd>bn<cr>", opts)
key("n", "<c-h>", "<cmd>bp<cr>", opts)
key("n", "<c-k>", "<cmd>bp<cr><cmd>bd #<cr>", opts)

-- keep the cursor centered on the screen
key("n", "n", "nzzzv", opts)
key("n", "N", "Nzzzv", opts)

-- telescope
local tp_ok, tp = pcall(require, "telescope.builtin")
if tp_ok then
	key("n", "<c-p>", tp.find_files, opts)
	key("n", "<leader>fg", tp.live_grep, opts)
	key("n", "<leader>fa", tp.buffers, opts)
end

-- luasnip
local ls_ok, ls = pcall(require, "luasnip")
if ls_ok then
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

-- dap
local dap_ok, dap = pcall(require, "dap")
if dap_ok then
	key("n", "<f5>", dap.continue, opts)
	key("n", "<f6>", dap.terminate, opts)
	key("n", "<f9>", dap.toggle_breakpoint, opts)
	key("n", "<f10>", dap.step_over, opts)
	key("n", "<f11>", dap.step_into, opts)
	key("n", "<f12>", dap.step_out, opts)

	local dapui_ok, dapui = pcall(require, "dapui")
	if dapui_ok then
		key("n", "<leader>de", dapui.eval, opts)
	end
end

-- ----- Insert ----- --
-- undo break points
key("i", ",", ",<c-g>u", opts)
key("i", ".", ".<c-g>u", opts)
key("i", "!", "!<c-g>u", opts)
key("i", "?", "?<c-g>u", opts)

-- ----- Visual ----- --
-- move lines up and down while selected
key("v", "J", ":m '>+1<cr>gv", opts)
key("v", "K", ":m '<-2<cr>gv", opts)

-- stay in indent mode
key("v", "<", "<gv", opts)
key("v", ">", ">gv", opts)

-- run figlet on the selected content
key("v", "<leader>ff", ":!figlet<cr>", opts)
