local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local extras = require("luasnip.extras")
local rep = extras.rep

return {
  s("log", {
    t("console.log("),
    i(1, ""),
    t(");"),
  }),

  s("rfc", {
    t("function "),
    i(1, ""),
    t(" () {"),
    t({ "", "  return <>" }),
    i(2, ""),
    t({ "</>" }),
    t({ "", "};", "", "" }),
    t("export default "),
    rep(1),
    t(";"),
  }),
}
