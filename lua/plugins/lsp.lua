return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      { 'lukas-reineke/lsp-format.nvim', config = true}
    },
    config = function()
      local lsp_format = require('lsp-format')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      local lsp_zero = require('lsp-zero')
      lsp_zero.preset("recommended")
      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
        lsp_format.on_attach(client, bufnr)
      end)

      local lsp_config = require('lspconfig')
      local mason = require('mason')
      mason.setup({})

      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
          ensure_installed = {
            "autotools_ls",
            "clangd",
            "cmake",
            "cssls",
            "dockerls",
            "glslls",
            "html",
            "jsonls",
            "markdown_oxide",
            "pyright",
            "volar",
          },
          handlers = {
            function(server_name)
              lsp_config[server_name].setup({
                  on_attach = on_attach,
                  capabilities = cmp_nvim_lsp.default_capabilities(),
              })
            end,

            clangd = function()
              lsp_config.clangd.setup({
                  on_attach = on_attach,
                  capabilities = cmp_nvim_lsp.default_capabilities(),
                  cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                  },
              })
            end,
          },
      })
    end,
  },
}
