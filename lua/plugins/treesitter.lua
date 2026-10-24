local treesitter = require "nvim-treesitter"

treesitter.setup {}

-- put the language you want in this array
treesitter.install {
  "bash",
  "c",
  "cpp",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "toml",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

local highlight_disable = { css = true } -- list of language that will be disabled
local indent_disable = { python = true, css = true }

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if highlight_disable[ft] then
      return
    end
    -- pcall: skip filetypes whose parser is not installed
    if not pcall(vim.treesitter.start, args.buf) then
      return
    end
    if not indent_disable[ft] then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
