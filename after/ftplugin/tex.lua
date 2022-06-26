-- ---------- Latex options ---------- --
-- Latex specific options
local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  textwidth = 80,
  number = false,
  relativenumber = false,
  signcolumn = "no",
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end

-- Options for the keybindings
local opts = { noremap = true, silent = true, buffer = 0 }

-- Set latex specific keybindings
vim.keymap.set("n", "<m-m>", "<cmd>w! | execute '!compiler ' . expand('%:p')<cr>", opts)
vim.keymap.set("n", "<m-o>", "<cmd> execute '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>", opts)
vim.keymap.set("i", "!<tab>", "\\documentclass{article}<cr><cr>\\usepackage[margin=1in]{geometry}<cr><cr>\\title{}<cr>\\author{<++>}<cr><cr>\\begin{document}<cr><cr>\\maketitle<cr><++><cr><cr>\\end{document}<esc>8k$i", opts)
vim.keymap.set("i", ";be<tab>", "\\begin{}<cr>\\end{<++>}<esc>k$i", opts)
vim.keymap.set("i", ";s<tab>", "\\section{}<cr><cr><++><esc>2k$i", opts)
vim.keymap.set("i", ";ss<tab>", "\\subsection{}<cr><cr><++><esc>2k$i", opts)
vim.keymap.set("i", ";sss<tab>", "\\subsubsection{}<cr><cr><++><esc>2k$i", opts)
vim.keymap.set("i", ";eq<tab>", "\\[<cr><cr>\\]<esc>ki", opts)
vim.keymap.set("i", ";ie<tab>", "$$ <++><esc>5hi", opts)
vim.keymap.set("i", ";e<tab>", "\\textit{} <++><esc>5hi", opts)
vim.keymap.set("i", ";b<tab>", "\\textbf{} <++><esc>5hi", opts)
vim.keymap.set("i", ";ce<tab>", "\\begin{center}<cr><cr>\\end{center}<esc>kA", opts)
vim.keymap.set("i", ";en<tab>", "\\begin{enumerate}<cr>\\item <cr>\\end{enumerate}<esc>kA", opts)
vim.keymap.set("i", ";it<tab>", "\\begin{itemize}<cr>\\item <cr>\\end{itemize}<esc>kA", opts)
vim.keymap.set("i", ";i<tab>", "<esc>cc\\item<space>", opts)
vim.keymap.set("i", "<c-l>", "<esc>:let @0=@/<cr>/<++><cr>:let @/=@0<cr>ca<", opts)

-- Disable nvim-cmp for latex
local status_ok, cmp = pcall(require, "cmp")
if status_ok then
  cmp.setup.buffer({ enabled = false })
end
