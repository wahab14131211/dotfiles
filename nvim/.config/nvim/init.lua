-- Custom neovim file made for wahab14131211
-- Maintainer: Wahab

--source files for basic setup and remaps
require("set")
require("remap")

--bootstrap lazy.nvim to manage plugins
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    root = vim.fn.stdpath("config") .. "/lazy/plugins",
    change_detection = {notify = false},
})
