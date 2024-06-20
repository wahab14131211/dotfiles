-- Custom neovim config file for common remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --open netrw (directory viewer) using space+p+v

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --move highlighted text up and down (and into if statements)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --move highlighted text up and down (and into if statements)

vim.keymap.set("n", "J", "mzJ`z") --append line below to current line with space (keep cursor on existing character)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) --paste over highlight without adding highlight to buffer using space+p

-- next greatest remap ever : asbjornHaland -- No longer needed due to clipboard setting in set.lua
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) --use space+y to yank something into + register (i.e. system clipboard)
vim.keymap.set("n", "<leader>Y", [["+Y]]) --use space+y to yank something into + register (i.e. system clipboard)

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) --delete highlight without adding to the register using space+d

vim.keymap.set("i", "<C-c>", "<Esc>") --remap Ctrl+c to Esc to allow visual block test insertion with Ctrl+c
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "Q", "<nop>") --Q will exit without saving. remove this in favour of :q!

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --use space+s to search and replace current word
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) --use space+x to make current file executable

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") --clear highlights on pressing <Esc>
