(setq user-full-name "David Lewis"
      user-mail-address "davidalewis00@gmail.com")

(setq doom-theme 'doom-nord)
(setq doom-themes-treemacs-theme "doom-colors")
(add-hook 'pdf-tools-enabled-hook 'pdf-view-themed-minor-mode)

(setq org-directory "~/Dropbox/org/")

(setq org-hide-emphasis-markers 't)

(after! evil-org
  (setq org-tab-first-hook nil))

(defun insert-jupyter-python-block ()
  "Inserts a python code block"
  (interactive)
  (progn
    (insert "#+begin_src jupyter-python :session py\n"
            "#+end_src")
    )
  (org-edit-special)
  )

(defun insert-jupyter-ess-block()
  "Inserts an ESS(R) code block"
  (interactive)
  (insert "#+begin_src jupyter-R :session R\n"
          "#+end_src")
  (org-edit-special)
  )

(defun insert-elisp-block()
  "inserts an elisp code block"
  (interactive)
  (insert "#+begin_src elisp\n"
          "#+end_src")
  (org-edit-special)
  )

(defun insert-generic-block()
  "inserts an elisp code block"
  (interactive)
  (insert "#+begin_src " (read-string "Enter src type:") "\n"
          "#+end_src")
  (org-edit-special)
  )
(defun insert-gnuplot-block()
  (interactive)
  (insert "#+begin_src gnuplot :results output :file " (read-string "Enter file name:") "\n"
          "#+end_src")
  (org-edit-special)
  )

(defun copy-down-x (x)
  "copies the current cell down by the universal arg"
  (interactive "P")
  (cl-loop repeat (or x  1)
           do (org-table-copy-down 0))
        )
(defun universal-test (x)
  (interactive "P")
  (cl-loop repeat x
           do (message "hello"))
  (message "done"))

(defun cache-address ()
 (interactive)
 (progn
   (setq size (read-string "Enter the MM size: "))
   (setq strunit (substring size -2 nil))
   (if (eq (compare-strings strunit nil nil "GB" nil nil) 't)
       (message "true"))
 )
 )

(after! evil-org
(setq org-image-actual-width 400))

(map! (:after org
       :map org-mode-map
       :nvi "S-<return>" #'copy-down-x
       :leader
       (:prefix ("j" . "jupyter-source")
        :desc "jupyter-python" "p" #'insert-jupyter-python-block
        :desc "jupyter-R" "r" #'insert-jupyter-ess-block
        :desc "elisp" "e" #'insert-elisp-block
        :desc "gnuplot" "g" #'insert-gnuplot-block
        :desc "generic" "b" #'insert-generic-block)))

(setq org-fontify-todo-headline t)

(defadvice! +org-dont-fontify-my-thangs-a (orig-fn &rest args)
  :around '(org-superstar-mode org-fancy-priorities-mode)
  (letf! ((#'font-lock-ensure #'ignore)
          (#'font-lock-flush #'ignore)
          (#'font-lock-fontify-buffer #'ignore))
    (apply orig-fn args)))

(add-to-list 'safe-local-eval-forms '(add-hook 'after-save-hook 'org-html-export-to-html t t))
(add-to-list 'safe-local-eval-forms '(add-hook 'after-save-hook 'org-re-reveal-export-to-html t t))

(add-to-list 'safe-local-eval-forms '(add-hook 'after-save-hook 'org-latex-export-to-pdf t t))

(add-to-list 'safe-local-eval-forms '(add-hook 'after-save-hook 'org-babel-tangle t t))

(add-to-list '+format-on-save-enabled-modes 'web-mode 1)

(after! gnuplot (add-to-list '*org-babel-gnuplot-terms* '(png . "pngcairo transparent")))

(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode)
  :config)

(after! org
  (setq! org-startup-with-latex-preview t)
  (setq! org-startup-with-inline-images t)
  (setq! org-latex-image-default-width "1in")
  (setq! org-cite-export-processors '(t csl))
  (setq! org-cite-global-bibliography (list"~/Dropbox/org/citations/citations.json"))
  (setq! yas/triggers-in-field t)
  (setq! org-export-allow-bind-keywords t))
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes '("apa" "\\documentclass[11pt]{apa7}"
                                    ("\\part{%s}" . "\\part*{%s}")
                                    ("\\chapter{%s}" . "\\chapter*{%s}")
                                    ("\\section{%s}" . "\\section*{%s}")
                                    ("\\subsection{%s}" . "\\subsection*{%s}")
                                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(use-package! bibtex-completion
  :defer t
  :config
  (setq bibtex-completion-additional-search-fields '(keywords)
        bibtex-completion-pdf-field "file")) ; This tell bibtex-completion to look at the File field of the bibtex to figure out which pdf to open

(use-package! bibtex-actions
  :after embark bibtex-completion
  :config
  (add-to-list 'embark-keymap-alist '(bibtex . bibtex-actions-map)))

(use-package! citeproc
  :defer t)

;;; Org-Cite configuration

(use-package! oc
  :after org bibtex-completion bibtex-actions
  :config
  (require 'ox)
  (map! :map org-mode-map
        :localleader
        :desc "Insert citation" "@" #'org-cite-insert)
  (defvar bibtex-actions-bibliography nil)
  (setq org-cite-global-bibliography
        (let ((paths (or bibtex-actions-bibliography
                         bibtex-completion-bibliography)))
          ;; Always return bibliography paths as list for org-cite.
          (if (stringp paths) (list paths) paths)))
  ;; setup export processor; default csl/citeproc-el, with biblatex for latex
  (setq org-cite-export-processors '((t csl))))

;;; Org-cite processors

;;;; Core

(use-package! oc-basic
  :after oc)

(use-package! oc-biblatex
  :after oc)

(use-package! oc-csl
  :after oc
  :config
  (setq org-cite-csl-styles-dir "~/Zotero/styles"))

(use-package! oc-natbib
  :after oc)

(setq! org-global-properties '(("header-args:latex" . ":results output file graphics :imagemagick yes :headers '(\"\\\\usepackage{tikz}\ \\\\usepackage{siunitx}\ \\\\usepackage{gensymb}\") :fit yes :iminoptions -density 600")
                               ("header-args" . ":pandoc t")))

(use-package! org-krita
  :config
  (add-hook 'org-mode-hook 'org-krita-mode))

(after! org
  (setq! org-startup-truncated 'nil)
  )

(setq! TeX-engine 'luatex)
(setq! org-latex-pdf-process '("lualatex -f -pdf -%latex -interaction=nonstopmode -output-directory=%o %f"))

(map!  (:after auctext
       :map LaTeX-mode-map
       :leader
       :desc "compile" "c" #'TeX-command-master))

(setq! ispell-personal-dictionary "~/.config/spell/dict.txt")

(setq ispell-program-name "hunspell")
(ispell-check-version)

(setq conda-anaconda-home "~/opt/anaconda")

(map! (:after ess-mode
       :map ess-mode-map
       :nvi "C-<return>" #'ess-eval-line-and-step
       :nvi "M-e" #'insert-R-assign
       )
      )

(setq ess-R-font-lock-keywords '(
 (ess-R-fl-keyword:keywords . t)
 (ess-R-fl-keyword:constants . t)
 (ess-R-fl-keyword:modifiers . t)
 (ess-R-fl-keyword:fun-defs . t)
 (ess-R-fl-keyword:assign-ops . t)
 (ess-R-fl-keyword:%op% . t)
 (ess-fl-keyword:fun-calls . t)
 (ess-fl-keyword:numbers . t)
 (ess-fl-keyword:operators . t)
 (ess-fl-keyword:delimiters . t)
 (ess-fl-keyword:= . t)
 (ess-R-fl-keyword:F&T . t)
 )
)

(setq inferior-ess-r-font-lock-keywords '(
 (ess-R-fl-keyword:keywords . t)
 (ess-R-fl-keyword:constants . t)
 (ess-R-fl-keyword:modifiers . t)
 (ess-R-fl-keyword:fun-defs . t)
 (ess-R-fl-keyword:assign-ops . t)
 (ess-R-fl-keyword:%op% . t)
 (ess-fl-keyword:fun-calls . t)
 (ess-fl-keyword:numbers . t)
 (ess-fl-keyword:operators . t)
 (ess-fl-keyword:delimiters . t)
 (ess-fl-keyword:= . t)
 (ess-R-fl-keyword:F&T . t)
 )
)

(defun insert-R-assign ()
  "Inserts the assign statement in R <-"
  (interactive)
  (insert "<-")
  )

(setq display-line-numbers-type nil)

(require 'ace-window)

(add-hook 'compilation-finish-functions
          (lambda(buffer string)
            (if (and (null (string-match ".*exited abnormally.*" string))
                     (null(eq major-mode 'inferior-python-mode)))
                ;; make compilation window go away after a few seconds
                (progn
                  (run-at-time
                   "1 sec" nil 'delete-windows-on
                   (get-buffer-create "*compilation*"))
                  (print major-mode)
                  (message "Compilation finished successfully")))))

(setq +ligatures-extras-in-modes '(org-mode))

(setq! ispell-dictionary "en_US")

(map! :leader
      :desc "treemacs" "0" #'treemacs
      :desc "last-buffer" "l" #'evil-switch-to-windows-last-buffer
      :nv "`" nil
      (:prefix ("w")
       :desc "ace-window" "a" #'ace-window))

(map!  (:map python-mode-map
        :localleader
        :desc "repl" "'" #'+python/open-ipython-repl
        (:prefix ("s" . "send")
         :desc "buffer" "b" #'python-shell-send-buffer
         :desc "function" "f" #'python-shell-send-defun
         :desc "region" "r" #'python-shell-send-region
         :desc "statement" "s" #'python-shell-send-statement)))

(map!  (:map prolog-mode-map
        :localleader
        :desc "repl" "'" #'run-prolog
        :desc "file" "f" #'prolog-consult-buffer
        :desc "region" "r" #'prolog-consult-region
        :desc "predicate" "p" #'prolog-consult-region))

(map! (:map doc-view-mode-map
       :nv "l" #'doc-view-next-page
       :nv "h" #'doc-view-previous-page))

(map! (:map mips-mode-map
       :localleader
       (:prefix ("s" . "send")
        :desc "file" "f" #'mips-run-file
        :desc "region" "r" #'mips-run-region
        :desc "buffer" "b" #'mips-run-region)))

(map! (:map haskell-mode-map
       :localleader
       :desc "send-file" "f" #'haskell-process-load-file
       :desc "open-haskell" "'" #'run-haskell))
