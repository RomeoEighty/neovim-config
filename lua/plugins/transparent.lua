local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
    return {}
end

-- vim.g.transparent_groups = vim.list_extend(
--   vim.g.transparent_groups or {},
--   vim.tbl_map(function(v)
--     return v.hl_group
--   end, vim.tbl_values(require('bufferline.config').highlights))
-- )

transparent.setup {
    -- table: default groups
    groups = {
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
    },
    -- table: additional groups that should be cleared
    extra_groups = {
        'BufferLineInfoVisible',
        'BufferLineHintDiagnosticSelected',
        'BufferLineHintDiagnosticVisible',
        'BufferLineHintDiagnostic',
        'BufferLineHintSelected',
        'BufferLineHintVisible',
        'BufferLineDiagnosticSelected',
        'BufferLineDiagnosticVisible',
        'BufferLineNumbersVisible',
        'BufferLineNumbersSelected',
        'BufferLineBufferSelected',
        'BufferLineBufferVisible',
        'BufferLineCloseButtonSelected',
        'BufferLineCloseButtonVisible',
        'BufferLineCloseButton',
        'BufferLineTabClose',
        'BufferLineTabSelected',
        'BufferLineGroupLabel',
        'BufferLineGroupSeparator',
        'BufferLineTruncMarker',
        'BufferLineModified',
        'BufferLineHint',
        'BufferLineBuffer',
        'BufferLineDiagnostic',
        'BufferLineNumbers',
        'BufferLineFill',
        'BufferLinePick',
        'BufferLineIndicatorSelected',
        'BufferLineWarning',
        'BufferLineBackground',
        'BufferLineError',
        'BufferLineWarningDiagnosticVisible',
        'BufferLineWarningDiagnosticSelected',
        'BufferLineOffsetSeparator',
        'BufferLinePickVisible',
        'BufferLinePickSelected',
        'BufferLineIndicatorVisible',
        'BufferLineInfo',
        'BufferLineTabSeparatorSelected',
        'BufferLineTabSeparator',
        'BufferLineSeparatorVisible',
        'BufferLineSeparatorSelected',
        'BufferLineDuplicate',
        'BufferLineDuplicateVisible',
        'BufferLineDuplicateSelected',
        'BufferLineModifiedSelected',
        'BufferLineModifiedVisible',
        'BufferLineErrorDiagnosticSelected',
        'BufferLineErrorDiagnosticVisible',
        'BufferLineErrorDiagnostic',
        'BufferLineErrorSelected',
        'BufferLineErrorVisible',
        'BufferLineSeparator',
        'BufferLineTab',
        'BufferLineWarningDiagnostic',
        'BufferLineWarningSelected',
        'BufferLineWarningVisible',
        'BufferLineInfoDiagnosticSelected',
        'BufferLineInfoDiagnosticVisible',
        'BufferLineInfoDiagnostic',
        'BufferLineInfoSelected',
        'BufferLineDevIconLicenseSelected',
        'BufferLineDevIconLicenseInactive',
        'BufferLineDevIconLicense',
        'BufferLineDevIconReadmeSelected',
        'BufferLineDevIconReadmeInactive',
        'BufferLineDevIconReadme',
        'BufferLineDevIconTomlSelected',
        'BufferLineDevIconToml',
        'TabLine',
        --'TabLineFill',
        --'TabLineSel',
    },
    -- table: groups you don't want to clear
    exclude_groups = {},
    -- function: code to be executed after highlight groups are cleared
    -- Also the user event "TransparentClear" will be triggered
    on_clear = function() end,
}
