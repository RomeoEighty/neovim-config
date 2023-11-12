local M = {
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = "all", -- put the language you want in this array
    ignore_install = { "" },                                                       -- List of parsers to ignore installing
    sync_install = true,                                                          -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M
-- local status_ok, configs = pcall(require, "nvim-treesitter.configs")
-- if not status_ok then
--     return
-- end
-- 
-- configs.setup {
--     ensure_installed = "all",
--     sync_install = false,
--     ignore_install = { "" }, -- List of parsers to ignore installing
--     highlight = {
--         enable = true, -- false will disable the whole extension
--         disable = { "" }, -- list of language that will be disabled
--         additional_vim_regex_highlighting = true,
--     },
--     indent = { enable = true, disable = { "yaml" } },
-- }
