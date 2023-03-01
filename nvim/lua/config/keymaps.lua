-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move to window using the <shift> hjkl keys
map("n", "<S-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<S-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<S-k>", "<C-w>k", { desc = "Go to upper window" })

if Util.has("bufferline.nvim") then
  map("n", "<S-j>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  -- cant get next to work
  -- map("n", "<S-k>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-j>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  -- map("n", "<S-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
