local M = {}

---@type snacks.Config
M.opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
        enabled = true,
        width = 60,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        -- These settings are used by some built-in sections
        preset = {
            -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
            ---@type fun(cmd:string, opts:table)|nil
            pick = nil,
            -- Used by the `keys` section to show keymaps.
            -- Set your custom keymaps here.
            -- When using a function, the `items` argument are the default keymaps.
            ---@type snacks.dashboard.Item[]
            keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
            -- Used by the `header` section
            --
            -- Block Elements
            --   https://www.unicode.org/charts/PDF/U2580.pdf
            --
            --       	0	1	2	3	4	5	6	7	8	9	A	B	C	D	E	F
            -- U+258x	▀	▁	▂	▃	▄	▅	▆	▇	█	▉	▊	▋	▌	▍	▎	▏
            -- U+259x	▐	░	▒	▓	▔	▕	▖	▗	▘	▙	▚	▛	▜	▝	▞	▟
            --
            -- Block elements
            -- 2580 ▀ UPPER HALF BLOCK
            -- 2581 ▁ LOWER ONE EIGHTH BLOCK
            -- 2582 ▂ LOWER ONE QUARTER BLOCK
            -- 2583 ▃ LOWER THREE EIGHTHS BLOCK
            -- 2584 ▄ LOWER HALF BLOCK
            -- 2585 ▅ LOWER FIVE EIGHTHS BLOCK
            -- 2586 ▆ LOWER THREE QUARTERS BLOCK
            -- 2587 ▇ LOWER SEVEN EIGHTHS BLOCK
            -- 2588 █ FULL BLOCK
            -- 2589 ▉ LEFT SEVEN EIGHTHS BLOCK
            -- 258A ▊ LEFT THREE QUARTERS BLOCK
            -- 258B ▋ LEFT FIVE EIGHTHS BLOCK
            -- 258C ▌ LEFT HALF BLOCK
            -- 258D ▍ LEFT THREE EIGHTHS BLOCK
            -- 258E ▎ LEFT ONE QUARTER BLOCK
            -- 258F ▏ LEFT ONE EIGHTH BLOCK
            -- 2590 ▐ RIGHT HALF BLOCK
            --
            -- Shade characters
            -- 2591 ░ LIGHT SHADE
            -- 2592 ▒ MEDIUM SHADE
            -- 2593 ▓ DARK SHADE
            --
            -- Block elements
            -- 2594 ▔ UPPER ONE EIGHTH BLOCK
            -- 2595 ▕ RIGHT ONE EIGHTH BLOCK
            --
            -- Terminal graphic characters
            -- 2596 ▖ QUADRANT LOWER LEFT
            -- 2597 ▗ QUADRANT LOWER RIGHT
            -- 2598 ▘ QUADRANT UPPER LEFT
            -- 2599 ▙ QUADRANT UPPER LEFT AND LOWER LEFT AND LOWER RIGHT
            -- 259A ▚ QUADRANT UPPER LEFT AND LOWER RIGHT
            -- 259B ▛ QUADRANT UPPER LEFT AND UPPER RIGHT AND LOWER LEFT
            -- 259C ▜ QUADRANT UPPER LEFT AND UPPER RIGHT AND LOWER RIGHT
            -- 259D ▝ QUADRANT UPPER RIGHT
            -- 259E ▞ QUADRANT UPPER RIGHT AND LOWER LEFT
            -- 259F ▟ QUADRANT UPPER RIGHT AND LOWER LEFT AND LOWER RIGHT
            header = [[
  ▟▙▚   ▙▚  
 ▟██▙▚  █▙▚ 
▐██▜█▙▚ ██▌▌
▐██▐▜█▙▚██▌▌
▐██▐ ▜█▙██▌▌
 ▜█▐  ▜██▛▞ 
  ▜▐   ▜▛▞  ]],
        },
        -- item field formatters
        formats = {
            icon = function(item)
                if item.file and item.icon == "file" or item.icon == "directory" then
                    return M.icon(item.file, item.icon)
                end
                return { item.icon, width = 2, hl = "icon" }
            end,
            footer = { "%s", align = "center" },
            header = { "%s", align = "center" },
            file = function(item, ctx)
                local fname = vim.fn.fnamemodify(item.file, ":~")
                fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
                if #fname > ctx.width then
                    local dir = vim.fn.fnamemodify(fname, ":h")
                    local file = vim.fn.fnamemodify(fname, ":t")
                    if dir and file then
                        file = file:sub(-(ctx.width - #dir - 2))
                        fname = dir .. "/…" .. file
                    end
                end
                local dir, file = fname:match("^(.*)/(.+)$")
                return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
            end,
        },
        sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
        },
    },
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
