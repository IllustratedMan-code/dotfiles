(setq user-full-name "David Lewis"
      user-mail-address "davidalewis00@gmail.com")

(setq doom-theme 'doom-gruvbox)
(setq doom-themes-treemacs-theme "doom-colors")

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

(map! (:map org-mode-map
       :leader
       (:prefix ("j" . "jupyter-source")
        :desc "jupyter-python" "p" #'insert-jupyter-python-block
        :desc "jupyter-R" "r" #'insert-jupyter-ess-block
        :desc "elisp" "e" #'insert-elisp-block)))

(setq org-fontify-todo-headline t)

(defadvice! +org-dont-fontify-my-thangs-a (orig-fn &rest args)
  :around '(org-superstar-mode org-fancy-priorities-mode)
  (letf! ((#'font-lock-ensure #'ignore)
          (#'font-lock-flush #'ignore)
          (#'font-lock-fontify-buffer #'ignore))
    (apply orig-fn args)))

(add-to-list 'safe-local-eval-forms '(add-hook 'after-save-hook 'org-html-export-to-html t t))
(add-to-list 'safe-local-eval-forms '(add-hook 'after-save-hook 'org-re-reveal-export-to-html t t))

(add-to-list 'safe-local-eval-forms '(add-hook 'after-save-hook 'org-babel-tangle t t))

(add-to-list '+format-on-save-enabled-modes 'web-mode 1)

(setq conda-anaconda-home "~/opt/anaconda")

(map! (:map ess-mode-map
       :nv "C-<return>" #'ess-eval-line-and-step
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

(map! (:map doc-view-mode-map
       :nv "l" #'doc-view-next-page
       :nv "h" #'doc-view-previous-page))

(map! (:map mips-mode-map
       :localleader
       (:prefix ("s" . "send")
        :desc "file" "f" #'mips-run-file
        :desc "region" "r" #'mips-run-region
        :desc "buffer" "b" #'mips-run-region)))
