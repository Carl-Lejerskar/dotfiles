-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_keymap("n", "<S-X>", ':lua vim.cmd("b#|bd#")<CR>', { noremap = true, silent = true })
