if vim.loader then
    vim.loader.enable()
end

for _, source in ipairs {
    "configs.options",
    "configs.keymaps",
    "plugins.plugins",
    "plugins.lualine",
    "plugins.colorscheme",
    "plugins.cmp",
    "plugins.lsp",
    "plugins.telescope",
    "plugins.treesitter",
    "plugins.local-highlight",
    "plugins.gitsigns",
    "plugins.comment",
    "plugins.nvim-tree",
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
end
