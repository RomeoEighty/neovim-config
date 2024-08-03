if vim.loader then
    vim.loader.enable()
end

local config_files = {
    "configs.keymaps",
    "configs.options",
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
    "plugins.bufferline",
}

for _, source in ipairs(config_files) do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
end
