local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'eslint',
        'rust_analyzer'
    },
    handlers = {
        lsp_zero.default_setup
    }
})

lsp_zero.preset('recommended')
lsp_zero.setup()

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      procMacro = {
        enable = true;
      },
      assist = {
        importEnforceGranularity = true,
      },
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = 'clippy',
      },
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
        disabled = {"unresolved-proc-macro"},
      }
    }
  }
}


--lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
--  lsp_zero.default_keymaps({buffer = bufnr})
--end)

---
-- Replace these language servers
-- with the ones you have installed in your system
---
--require('lspconfig').lua_ls.setup({})
--require('lspconfig').rust_analyzer.setup({})
