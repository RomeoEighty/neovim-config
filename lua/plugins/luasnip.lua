local plugin_status_ok, luasnip = pcall(require, "luasnip")
if not plugin_status_ok then
    return {}
end

-- some shorthands...
local snippet = luasnip.snippet
local snippet_node = luasnip.snippet_node
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node
local function_node = luasnip.function_node
local choice_node = luasnip.choice_node
local dynamic_node = luasnip.dynamic_node
local restore_node = luasnip.restore_node

local lambda = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local partial = require("luasnip.extras").partial
local match = require("luasnip.extras").match
local nonempty = require("luasnip.extras").nonempty
local dynamic_lambda = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

-- Shortcut to populate snip.env.TM_SELECTED_TEXT
-- When you hit ctrl-s, current selection will be cleared and you will be
-- prompted to type the snippet name.
luasnip.config.set_config({
  store_selection_keys = '<c-s>',
})

luasnip.add_snippets(nil, {
    all = {
        snippet({
            trig = "dt",
            namr = "Datetime",
            dscr = "Date in the form of YYYY-MM-DDTHHMMSS",
        }, {
            function_node(function()
                return {os.date('%Y-%m-%dT%H%M%S')}
            end, {}),
        }),
    },
    sh = {
        snippet({
            trig = "date",
            namr = "Date Shortcut",
            dscr = "ISO8601 like format",
        }, {
            text_node({"date \"+%FT%H%M%S\""}),
        }),
        snippet({
            trig = "scriptpath",
            namr = "script path idiom",
            dscr = "https://stackoverflow.com/a/4774063",
        }, {
            text_node({"SCRIPTPATH=\"$( cd -- \"$(dirname \"$0\")\" >/dev/null 2>&1 ; pwd -P )\""}),
        }),
        snippet({
            trig = "loggingfunc",
            namr = "logging function idiom",
            dscr = "",
        }, {
            text_node({"# shellcheck disable=2059",
                "function logging",
                "{",
                "    local -r msg=\"$1\\n\"",
                "    printf \"${msg}\\n\" \"${@:2}\"",
                "}",
            })
        }),
    },
    markdown = {
        snippet({
            trig = "details",
            namr = "HTML details",
            dscr = "Create HTML details disclosure tag."
        }, {
            text_node({
                '<details>',
                '<summary>'
            }),
            insert_node(1),
            text_node({
                '</summary>',
                ''
            }),
            insert_node(2),
            text_node({
                '',
                '</details>',
                ''
            }),
            insert_node(0)
        }),
        snippet({
            trig = "link",
            namr = "markdown_link",
            dscr = "Create markdown link [txt](url - stored on pressing Ctrl-S)"
        },
        {
            text_node('['),
            insert_node(1),
            text_node(']('),
            function_node(function(_, snip)
                return snip.env.TM_SELECTED_TEXT[1] or {}
            end, {}),
            text_node(')'),
            insert_node(0),
        }),
    },
})
