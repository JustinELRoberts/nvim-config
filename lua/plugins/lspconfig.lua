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
      local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

      lspconfig.lua_ls.setup({
        on_attach = function(client, bufnr)
          lspformat.on_attach(client, bufnr)
          -- Custom macro to print() the active selection
          vim.fn.setreg("l", "yoprint('" .. esc .. "pa: ', " .. esc .. "pa);" .. esc .. "")
        end
      })

      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
          lspformat.on_attach(client, bufnr)
          -- Custom macro to console.log() the active selection
          vim.fn.setreg("l", "yoconsole.log('" .. esc .. "pa: ', " .. esc .. "pa);" .. esc .. "")
        end
      })

      lspconfig.html.setup({
        on_attach = function(client, bufnr)
          lspformat.on_attach(client, bufnr)
          -- Custom macro to console.log() the active selection
          vim.fn.setreg("l", "yoconsole.log('" .. esc .. "pa: ', " .. esc .. "pa);" .. esc .. "")
        end
      })

      lspconfig.rust_analyzer.setup {
        filetypes = { "rust" },
        on_attach = function(client, bufnr)
          lspformat.on_attach(client, bufnr)
          -- Enable type hints
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          -- Custom macro to println!() the active selection
          vim.fn.setreg("l", "yoprintln!(\"" .. esc .. "pa: {:#?}\", " .. esc .. "pa);" .. esc .. "")
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
        on_attach = function(_, _)
          -- Custom macro to print() the active selection
          vim.fn.setreg("l", "yoprint('" .. esc .. "pa: ', " .. esc .. "pa);" .. esc .. "")
        end,
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
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({
          border = 'rounded',
        })
      end)

      vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = true })
    end,
  }
}
