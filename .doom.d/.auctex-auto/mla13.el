(TeX-add-style-hook
 "mla13"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "letterpaper") ("babel" "american") ("biblatex" "style=mla" "mladraft=true" "annotation=true")))
   (TeX-run-style-hooks
    "geometry"
    "babel"
    "csquotes"
    "setspace"
    "biblatex"
    "color"
    "datetime"
    "fancyhdr")
   (TeX-add-symbols
    '("class" 1)
    '("professor" 1)
    '("lastname" 1)
    '("firstname" 1)
    '("sources" 1)
    "makeheader"
    "makeworkscited"
    "section"
    "thesection")
   (LaTeX-add-environments
    "nospacecenter"))
 :latex)

