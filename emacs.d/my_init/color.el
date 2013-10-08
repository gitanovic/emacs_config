;;; Use color theme 
(unless (eq (getenv "TEMP" ) "xterm-mono" )
  (require 'color-theme)
  (when window-system
    (set-face-attribute 'default nil :font "Droid Sans Mono-10" )
    )
  (eval-after-load "color-theme"
    '(color-theme-initialize))
  (color-theme-vim-colors)
;  (color-theme-emacs-nw)
;  (color-theme-jb-simple)
;  (color-theme-scintilla)
;  (color-theme-oswald)
;  (color-theme-gray30)
  )
