local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'rust_analyzer'
    },
    handlers = {
        lsp_zero.default_setup
    }
})

require('lspconfig')['hls'].setup{
   filetypes = { 'haskell', 'lhaskell', 'cabal' },
   cmd = { 'haskell-language-server-wrapper', '--lsp' },
}

lsp_zero.preset('recommended')
lsp_zero.setup()


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
