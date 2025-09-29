local handlers = require("plugins.lsp.handlers")

return {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
            },
        },
    },
    on_attach = function(client, bufnr)
        handlers.on_attach(client, bufnr)      -- Call the common on_attach first
        -- Add pyright-specific logic here if needed
    end,
}
