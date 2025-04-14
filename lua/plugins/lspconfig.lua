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
    dependencies = {
      { "ms-jpq/coq_nvim", branch = "coq" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lspformat = require("lsp-format")

      lspconfig.lua_ls.setup({
        on_attach = lspformat.on_attach
      })

      lspconfig.ts_ls.setup({
        on_attach = lspformat.on_attach
      })

      lspconfig.html.setup({
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

      lspconfig.bash.setup({
        on_attach = lspformat.on_attach
      })

      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = true })
    end,
  }
}
