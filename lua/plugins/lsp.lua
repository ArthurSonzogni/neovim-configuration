return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      { 'lukas-reineke/lsp-format.nvim', config = true}
    },
    config = function()
      -- Mason is a Neovim plugin that allows you to easily manage external
      -- editor tooling such as LSP servers, DAP servers, linters, and
      -- formatters through a single interface.
      local mason = require('mason')
      mason.setup({})

      -- Mason LSP Config is a Neovim plugin that provides a simple interface
      -- for setting up LSP servers using the lspconfig plugin.
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
          ensure_installed = {
            "autotools_ls",
            "cmake",
            "clangd",
            "cssls",
            "dockerls",
            "glslls",
            "html",
            "jsonls",
            "markdown_oxide",
            "pyright",
            "volar",
          },
        })

      -- Reserve a space in the gutter
      vim.opt.signcolumn = 'yes'

      local lsp_config = require('lspconfig')

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      lsp_config.util.default_config.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_config.util.default_config.capabilities,
        cmp_nvim_lsp.default_capabilities()
      )

      lsp_config.clangd.setup({})
      lsp_config.cmake.setup({})
      lsp_config.cssls.setup({})
      lsp_config.dockerls.setup({})
      lsp_config.glslls.setup({})
      lsp_config.html.setup({})
      lsp_config.jsonls.setup({})
      lsp_config.markdown_oxide.setup({})
      lsp_config.pyright.setup({})
      lsp_config.volar.setup({})

      local cmp = require('cmp')
      cmp.setup({
          sources = {
            {name = 'nvim_lsp'},
          },
          snippet = {
            expand = function(args)
              -- You need Neovim v0.10 to use vim.snippet
              vim.snippet.expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({}),
        })

    end,
  },
}
