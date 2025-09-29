require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
})

local servers = {
    "bashls",
    "clangd",
    "lua_ls",
    "pyright",
    "jsonls",
}

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_enable = true,
})

for _, server in pairs(servers) do
    local name = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. name)
    -- vim.notify(server .. " server loaded")
    if not require_ok then
        vim.notify("FAILED: require plugins.lsp.settings." .. name)
    end

    if not type(conf_opts) == "table" then
        vim.notify("FAILED: plugins.lsp.settings." .. name .. " does not return table.")
    end

    vim.lsp.config(name, conf_opts)
end
