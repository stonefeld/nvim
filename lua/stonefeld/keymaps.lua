-- ---------- Keymaps ---------- --
-- Default options for keybindings
local opts = { noremap = true, silent = true }

-- Set the leader key to space
vim.g.mapleader = " "

-- Create keymap alias
local key = vim.keymap

-- ----- Normal ----- --
-- Open file explorer
key.set("n", "<leader>e", "<cmd>Explore<cr>", opts)

-- Resize panes
key.set("n", "<c-left>", "<cmd>vertical resize +5<cr>", opts)
key.set("n", "<c-right>", "<cmd>vertical resize -5<cr>", opts)
key.set("n", "<c-up>", "<cmd>resize +1<cr>", opts)
key.set("n", "<c-down>", "<cmd>resize -1<cr>", opts)

-- Navigating buffers
key.set("n", "<c-l>", "<cmd>bn<cr>", opts)
key.set("n", "<c-h>", "<cmd>bp<cr>", opts)
key.set("n", "<c-k>", "<cmd>bp<cr><cmd>bd #<cr>", opts)

-- Keep the cursor centered on the screen
key.set("n", "n", "nzzzv", opts)
key.set("n", "N", "Nzzzv", opts)

-- Telescope
local status_tele, tele = pcall(require, "telescope.builtin")
if status_tele then
  key.set("n", "<c-p>", tele.find_files, opts)
  key.set("n", "<leader>fg", tele.live_grep, opts)
  key.set("n", "<leader>fa", tele.buffers, opts)
end

-- LuaSnip
local status_ls, ls = pcall(require, "luasnip")
if status_ls then
  key.set({ "i", "s" }, "<c-l>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, opts)
  key.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, opts)
end

-- Dap
local status_dap, dap = pcall(require, "dap")
if status_dap then
  key.set("n", "<f5>", dap.continue, opts)
  key.set("n", "<f6>", dap.terminate, opts)
  key.set("n", "<f10>", dap.step_over, opts)
  key.set("n", "<f11>", dap.step_into, opts)
  key.set("n", "<f12>", dap.step_out, opts)
  key.set("n", "<f9>", dap.toggle_breakpoint, opts)

  local status_dapui, dapui = pcall(require, "dapui")
  if status_dapui then
    key.set("n", "<leader>de", dapui.eval, opts)
  end
end

-- ----- Insert ----- --
-- Undo break points
key.set("i", ",", ",<c-g>u", opts)
key.set("i", ".", ".<c-g>u", opts)
key.set("i", "!", "!<c-g>u", opts)
key.set("i", "?", "?<c-g>u", opts)

-- ----- Visual ----- --
-- Move lines up and down while selected
key.set("v", "J", ":m '>+1<cr>gv", opts)
key.set("v", "K", ":m '<-2<cr>gv", opts)

-- Stay in indent mode
key.set("v", "<", "<gv", opts)
key.set("v", ">", ">gv", opts)

-- Run figlet on the selected content
key.set("v", "<leader>ff", ":!figlet<cr>", opts)
