vim.cmd[[colorscheme default]]
local colorscheme_name = "neofusion"

local status_ok, colorscheme = pcall(require, string.format('%s', colorscheme_name))
if not status_ok then
  vim.notify("colorscheme " .. colorscheme_name .. " not found!")
  return {}
end

colorscheme.setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})

vim.cmd("colorscheme " .. colorscheme_name)
