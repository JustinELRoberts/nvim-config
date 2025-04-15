return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = { "onsails/lspkind.nvim", "nvim-tree/nvim-web-devicons" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'defpult' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'enter' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    -- Styling the LSP menu
    completion = {
      menu = {
        auto_show = true,
        winhighlight = "Normal:NormalFloat",

        -- nvim-cmp style menu
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind",              gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },

  opts_extend = { "sources.default" }
}
