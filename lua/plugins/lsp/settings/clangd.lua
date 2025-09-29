local handlers = require("plugins.lsp.handlers")

return {
    -- Existing clangd settings (cmd, settings, etc.) can be placed here
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto","hpp"},
    on_attach = function(client, bufnr)
        handlers.on_attach(client, bufnr)      -- Call the common on_attach first
        -- Add clangd-specific logic here if needed
    end,
}
