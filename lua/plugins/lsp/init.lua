local status_ok, handlers = pcall(require, "plugins.lsp.handlers")
handlers.setup()

vim.lsp.config('*', {
    on_attatch = handlers.on_attach,
    capabilities = handlers.capabilities,
})

require("plugins.lsp.mason")
