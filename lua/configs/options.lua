vim.opt.viewoptions:remove "curdir" -- disable saving current directory with views
vim.opt.shortmess:append { s = true, I = true } -- disable startup message
vim.opt.backspace:append { "nostop" } -- Don't stop backspace at insert
if vim.fn.has "nvim-0.9" == 1 then
    vim.opt.diffopt:append "linematch:60" -- enable linematch diff algorithm
end
local options = {
    opt = {
        backup = false, -- Create a backup file
        breakindent = true, -- Wrap indent to match  line start
        clipboard = "unnamedplus", -- Connection to the system clipboard
        cmdheight = 1, -- hide command line unless needed
        completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
        conceallevel = 0, -- so that `` is visible in markdown files
        copyindent = true, -- Copy the previous indentation on autoindenting
        cursorline = true, -- Highlight the text line of the cursor
        expandtab = true, -- Enable the use of space in tab. To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>
        fileencoding = "utf-8", -- File content encoding for the buffer
        fileencodings = {
            "utf-8", "sjis", "cp932", "latin1", "ucs-bom", "iso-20220jp-3", "iso-2022-jp", "eucjp-ms", "euc-jisx0213", "euc-jp"
        }, -- A list of character encodings considered when starting to edit an existing file.
        fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
        foldenable = true, -- enable fold for nvim-ufo
        foldlevel = 99, -- set high foldlevel for nvim-ufo
        foldlevelstart = 99, -- start with all code unfolded
        foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
        history = 100, -- Number of commands to remember in a history table
        hlsearch = true, -- When there is a previous search pattern, highlight all its matches
        ignorecase = true, -- Case insensitive searching
        infercase = true, -- Infer cases in keyword completion
        laststatus = 2, -- globalstatus
        linebreak = true, -- Wrap lines at 'breakat'
        list = true,
        listchars = { tab = '> ', eol = '$' },
        mouse = "a", -- Enable mouse support
        number = true, -- Show numberline
        numberwidth = 4, -- set number column width to 4
        preserveindent = true, -- Preserve indent structure as much as possible
        pumheight = 15, -- Height of the pop up menu
        relativenumber = true, -- Show relative numberline
        scrolloff = 5, -- Number of lines to keep above and below the cursor
        shiftwidth = 4, -- Number of space inserted for indentation
        showmode = false, -- Disable showing modes in command line
        showtabline = 2, -- display tabline only if there are at least two tab pages
        sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
        signcolumn = "yes", -- Always show the sign column
        smartcase = true, -- Case sensitivie searching
        smartindent = true, -- Smarter autoindentation
        splitbelow = true, -- Splitting a new window below the current one
        splitkeep = vim.fn.has "nvim-0.9" == 1 and "screen" or nil, -- Maintain code view when splitting
        splitright = true, -- Splitting a new window at the right of the current one
        tabstop = 4, -- Number of space in a tab
        termguicolors = true, -- Enable 24-bit RGB color in the TUI
        timeoutlen = 500, -- Shorten key timeout length a little bit for which-key
        undofile = true, -- Enable persistent undo
        updatetime = 300, -- Length of time to wait before triggering the plugin
        virtualedit = "block", -- allow going past end of line in visual block mode
        wrap = false, -- Disable wrapping of lines longer than the width of window
        writebackup = false, -- Disable making a backup before overwriting a file
    },
    g = {
        highlighturl_enabled = true, -- highlight URLs by default
        mapleader = " ", -- set leader key
        maplocalleader = " ", -- set leader key
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
        lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        netrw_keepdir = 0
    },
    t = { bufs = vim.api.nvim_list_bufs() }, -- initialize buffers for the current tab
}

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end

-- vim.cmd [[set iskeyword+=-]] -- 'aa-bb' is one word
vim.cmd [[set iskeyword+=@-@]] -- '@abc' is one word

-- remember last position of file
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
