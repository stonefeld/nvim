return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    ls.add_snippets("markdown", {
      s("limg", {
        t("```{=latex}"),
        t({ "", "\\begin{center}" }),
        t({ "", "\t", "\\includegraphics[width=0.7\\textwidth]{" }), i(1), t("}"),
        t({ "", "\\end{center}" }),
        t({ "", "```", "" }),
        i(0),
      }),
      s("ceq", {
        t("$$"),
        t({ "", "\\begin{matrix}" }),
        t({ "", "\t" }), i(1),
        t({ "", "\\end{matrix}" }),
        t({ "", "$$", "" }),
      }),
    })
  end,
}
