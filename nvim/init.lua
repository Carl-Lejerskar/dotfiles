-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_keymap("n", "<S-X>", ':lua vim.cmd("b#|bd#")<CR>', { noremap = true, silent = true })
checker = {
  -- automatically check for plugin updates
  enabled = false,
  concurrency = nil, ---@type number? set to 1 to check for updates very slowly
  notify = false, -- get a notification when new updates are found
  frequency = 0, -- check for updates every hour
}
