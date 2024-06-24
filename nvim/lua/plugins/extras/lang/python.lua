return {
  -- Setup the Python language server with Ruff
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {}, -- Assumes Ruff LSP is available and correctly set up in your environment
      },
    },
  },

  -- Configuration for automatic formatting with Black on file save
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black.with({
            extra_args = { "--fast" }, -- Add any Black-specific arguments here
          }),
        },
        -- Automatically format files on save
        on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
          end
        end,
      })
    end,
  },
}
