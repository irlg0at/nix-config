-- tex.lua
local ls = require("luasnip")
local s  = ls.snippet
local fmta= require("luasnip.extras.fmt").fmta

ls.add_snippets("tex", {
  s({ trig = "boilerplate", dscr = "Populate empty LaTeX doc", snippetType = "snippet" },
    fmta([[
\documentclass{article}

\usepackage{float}
\usepackage{circledsteps}
\pgfkeys{/csteps/fill color=black}
\pgfkeys{/csteps/inner color=white}

\usepackage[backend=biber,style=authoryear]{biblatex}

% \addbibresource{references.bib}

\addbibresource{references.bib}
\usepackage[a4paper,top=2cm,bottom=2cm,left=2cm,right=2cm,marginparwidth=1.75cm]{geometry}

% Useful packages
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{xurl}
\usepackage[colorlinks=true, allcolors=blue]{hyperref}
\title{}
\author{}

\usepackage{titlesec}

\begin{document}
\maketitle
% \printbibliography
\end{document}
]], {})),
s({trig = "ttt", dscr = "Expand to texttt", snippetType="autosnippet"}, { t("\\texttt{"),i(1),t("}")})
})
