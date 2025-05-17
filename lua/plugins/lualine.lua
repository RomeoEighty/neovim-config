local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
    return {}
end
lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'}, -- { left = '', right = ''},
        section_separators = { left = '', right = ''}, -- { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'branch',
                cond = function()
                    return vim.api.nvim_win_get_width(0) > 80
                end,
            },
            'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
            {
                'searchcount',
                maxcount = 999999,
            },
            'encoding', 'fileformat',
            {
                'filetype',
                cond = function()
                    return vim.api.nvim_win_get_width(0) > 80
                end,
            },
        },
        lualine_y = {
            {
                'progress',
                cond = function()
                    return vim.api.nvim_win_get_width(0) > 80
                end,
            },
        },
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'progress'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
