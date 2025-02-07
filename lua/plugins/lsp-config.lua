-- These plugins provide lsp-related functionality
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup({})
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspformat = require("lsp-format")
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = lspformat.on_attach
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = lspformat.on_attach
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = lspformat.on_attach
      })
      lspconfig.rust_analyzer.setup {
        filetypes = { "rust" },
        on_attach = function(client, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          lspformat.on_attach(client, bufnr)
        end,
        settings = {
          ['rust_analyzer'] = {
            cargo = {
              allFeatures = true
            },
            checkOnSave = {
              allFeatures = true,
              command = "clippy"
            },
          },
        },
      }
      lspconfig.pyright.setup({
        settings = {
          python = {
            pythonPath = vim.fn.exepath("python3"),
          },
        }
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      vim.diagnostic.config({ jump = { float = true } })
      vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
    end,
  },
}
