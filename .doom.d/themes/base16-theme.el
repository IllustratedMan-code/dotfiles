(require 'doom-themes)


;;
;;; Variables

(defgroup doom-base16-theme nil
  "Options for the `doom-base16' theme."
  :group 'doom-themes)

(defcustom doom-base16-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-base16-theme
  :type 'boolean)

(defcustom doom-base16-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-base16-theme
  :type 'boolean)

(defcustom doom-base16-comment-bg doom-base16-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-base16-theme
  :type 'boolean)

(defcustom doom-base16-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-base16-theme
  :type '(choice integer boolean))

(eval-and-compile
  (defcustom doom-base16-region-highlight t
    "Determines the selection highlight style. Can be 'frost, 'snowstorm or t
(default)."
    :group 'doom-base16-theme
    :type 'symbol))


;;
;;; Theme definition

(def-doom-theme doom-base16
  "A dark theme inspired by Base16."

  ;; name        default   256       16
  ((bg         '("#2E3440" nil       nil            ))
   (bg-alt     '("#272C36" nil       nil            ))
   (base0      '("#191C25" "black"   "black"        ))
   (base1      '("#242832" "#1e1e1e" "brightblack"  ))
   (base2      '("#2C333F" "#2e2e2e" "brightblack"  ))
   (base3      '("#373E4C" "#262626" "brightblack"  ))
   (base4      '("#434C5E" "#3f3f3f" "brightblack"  ))
   (base5      '("#4C566A" "#525252" "brightblack"  ))
   (base6      '("#9099AB" "#6b6b6b" "brightblack"  ))
   (base7      '("#D8DEE9" "#979797" "brightblack"  ))
   (base8      '("#F0F4FC" "#dfdfdf" "white"        ))
   (fg         '("#ECEFF4" "#ECECEC" "white"        ))
   (fg-alt     '("#E5E9F0" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#BF616A" "#ff6655" "red"          )) ;; Base1611
   (orange     '("#D08770" "#dd8844" "brightred"    )) ;; Base1612
   (green      '("#A3BE8C" "#99bb66" "green"        )) ;; Base1614
   (teal       '("#8FBCBB" "#44b9b1" "brightgreen"  )) ;; Base167
   (yellow     '("#EBCB8B" "#ECBE7B" "yellow"       )) ;; Base1613
   (blue       '("#81A1C1" "#51afef" "brightblue"   )) ;; Base169
   (dark-blue  '("#5E81AC" "#2257A0" "blue"         )) ;; Base1610
   (magenta    '("#B48EAD" "#c678dd" "magenta"      )) ;; Base1615
   (violet     '("#5D80AE" "#a9a1e1" "brightmagenta")) ;; ??
   (cyan       '("#88C0D0" "#46D9FF" "brightcyan"   )) ;; Base168
   (dark-cyan  '("#507681" "#5699AF" "cyan"         )) ;; ??

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.2))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-base16-brighter-comments dark-cyan (doom-lighten base5 0.2)))
   (doc-comments   (doom-lighten (if doom-base16-brighter-comments dark-cyan base5) 0.25))
   (constants      blue)
   (functions      cyan)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           teal)
   (strings        green)
   (variables      base7)
   (numbers        magenta)
   (region         (pcase doom-base16-region-highlight
                     (`frost teal)
                     (`snowstorm base7)
                     (_ base4)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-base16-brighter-modeline)
   (-modeline-pad
    (when doom-base16-padded-modeline
      (if (integerp doom-base16-padded-modeline) doom-base16-padded-modeline 4)))

   (region-fg
    (when (memq doom-base16-region-highlight '(frost snowstorm))
      base0))

   (modeline-fg     nil)
   (modeline-fg-alt base6)

   (modeline-bg
    (if -modeline-bright
        (doom-blend bg base5 0.2)
      `(,(doom-darken (car bg) 0.1) ,@(cdr base2))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-blend bg base5 0.2)
      base1))
   (modeline-bg-inactive   `(,(doom-darken (car bg) 0.1)   ,@(cdr base2)))
   (modeline-bg-inactive-l `(,(doom-darken (car bg) 0.025) ,@(cdr base2))))


  ;;;; Base theme face overrides
  ((fringe :foreground teal)
   ((line-number &override) :foreground (doom-lighten 'base5 0.2))
   ((line-number-current-line &override) :foreground base7)
   ((font-lock-comment-face &override)
    :background (if doom-base16-comment-bg (doom-lighten bg 0.05)))
   ((tab-line &override) :background modeline-bg :foreground blue)
   ((tab-line-tab-inactive &override) :foreground dark-blue)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   ((region &override) :foreground region-fg)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-project-root-dir :foreground base6)
   ;;;; ediff <built-in>
   (ediff-fine-diff-A    :background (doom-darken violet 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-darken base0 0.25))
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; highlight-symbol
   (highlight-symbol-face :background (doom-lighten base4 0.1) :distant-foreground fg-alt)
   ;;;; highlight-thing
   (highlight-thing :background (doom-lighten base4 0.1) :distant-foreground fg-alt)
   ;;;; ivy
   ((ivy-current-match &override) :foreground region-fg :weight 'semi-bold)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; mic-paren
   ((paren-face-match &override) :foreground bg :background teal :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base7 :background red :weight 'ultra-bold)
   ;;;; org <built-in>
   (org-hide :foreground hidden)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   ;;;; vimish-fold
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override)  :foreground teal))

  ;;;; Base theme variable overrides-
  ())

;;; doom-base16-theme.el ends here
