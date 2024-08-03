local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.api.nvim_notify("lspconfig not found", vim.log.levels.ERROR, {})
    return {}
end

require "plugins.lsp.mason"
require("plugins.lsp.handlers").setup()
-- require "plugins.lsp.null-ls"
