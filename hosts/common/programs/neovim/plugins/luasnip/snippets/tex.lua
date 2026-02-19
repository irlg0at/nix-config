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
s({trig = "ttt", dscr = "Expand to texttt", snippetType="autosnippet"}, { t("\\texttt{"),i(1),t("}")}),
s({trig = "image", dscr = "Image figure", snippetType="snippet"}, fmta([[
    \begin{figure}[H]
     \center
     \includegraphics[width=\linewidth]{<>}
     \caption{<>}
     \label{<>}
    \end{figure}   
    ]],{i(1,"path"),i(2,"caption"),i(3,"label")}
  )),

s({trig = "code", dscr = "Code figure", snippetType="snippet"}, fmta([[
    \begin{figure}[H]
      \begin{minted}[fontsize=\footnotesize, escapeinside=||]{<>}
        <>
      \end{minted}
      \caption{<>}
      \label{<>}
    \end{figure}
    ]],{i(1,"type"),i(2,"code"),i(3,"caption"),i(4,"label")}
  ))
})
