local status_ok, localhighlight = pcall(require, "local-highlight")
if not status_ok then
    vim.notify("local-highlight not found!")
    return
end

localhighlight.setup {
    file_types = nil, -- If this is given only attach to this
    -- OR attach to every filetype except:
    disable_file_types = {'tex'},
    hlgroup = 'Search',
    cw_hlgroup = nil,
    -- Whether to display highlights in INSERT mode or not
    insert_mode = false,
}
