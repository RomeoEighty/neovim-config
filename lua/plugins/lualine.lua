local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
    return {}
end

local mode_map = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = require("neofusion.lualine"),
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
        lualine_a = {
            {
                'mode',
                fmt = function(res)
                    if vim.api.nvim_win_get_width(0) > 80 then
                        return res
                    else
                        return mode_map[res] or res
                    end
                end
            }
        },
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
