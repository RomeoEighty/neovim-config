local M = {}

---@type snacks.Config
M.opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false }, -- disabled because it's too slow
    statuscolumn = { enabled = true },
    words = { enabled = true },
}

M.keys = {
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
}

return M
