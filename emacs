(add-to-list 'load-path "~/emacs")
(add-to-list 'load-path "~/emacs/evil")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
;(add-to-list 'load-path "/etc/emacs/site-start.d")

; (load by default) C++ mode for .h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;(require 'evil)
;(evil-mode 1)

(require 'go-mode-load)

(require 'rec-mode)
(add-to-list 'auto-mode-alist '("\\.rec\\'" . rec-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (whiteboard))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; Set read only prompt
(add-hook 'shell-mode-hook
	  '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

(provide 'shellsetup)

;;; =======================
;;; Set IDE mode ;)

;;; Set gtags mode when in C or C++
(when window-system
  (add-hook 'c-mode-hook
	    '(lambda ()
	       (gtags-mode t)
	       (hs-minor-mode t)
;	       (speedbar t)
	       ))
  (add-hook 'c++-mode-hook
	    '(lambda () 
	       (gtags-mode t)
	       (hs-minor-mode t)
;	       (speedbar t)
	       ))
  )

(global-set-key (kbd "<f9>") 'gtags-find-tag-from-here)
(global-set-key (kbd "<f12>") 'gtags-pop-stack)

;;; tell in the modeline
(which-function-mode t)


(setq grep-find-command
      "grep -rnH --exclude=.git --include=\*.{c,cpp,h} --include -e 'pattern'")

(global-set-key (kbd "S-<f3>") 'find-grep)
;;; =======================

(delete-selection-mode t)

(show-paren-mode t)
(setq show-paren-style 'mixed)

;;; Enables globally to show lines numbers
;(global-linum-mode t)
(if (not window-system)
    (setq linum-format "%d "))

;(load "folding" 'nomessage 'noerror)
;(folding-mode-add-find-file-hook)

(setq inhibit-startup-message    t)        ; Don't want any startup message
(setq make-backup-files          nil)      ; Don't want any backup files
(setq auto-save-list-file-name   nil)      ; Don't want any .saves files
(setq auto-save-default          nil)      ; Don't want any auto saving
(when window-system
    (tool-bar-mode                   0)    ; Don't want any tool-bar
    (scroll-bar-mode                 0))   ; Don't want any scroll bar
(menu-bar-mode                       0)    ; Don't want any menu-bar

;;; NOTE for if 
; the form is:
; (if <then-function> <else-function>)
; for executing more than one statement sequencing is needed:
; (progn <f1> <f2> .. <fn>) returns result of fn
; (prog1 <f1> <f2> .. <fn>) returns result of f1
; (prog2 <f1> <f2> .. <fn>) returns result of f2

(setq search-highlight           t)        ; Highlight search object
(setq query-replace-highlight    t)        ; Highlight query object
(setq mouse-sel-retain-highlight t)        ; Keep mouse high-lightening
(put 'upcase-region 'disabled nil)
(column-number-mode)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c C-<left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c C-<right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c C-<up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c C-<down>")  'windmove-down)

; This saves history between sessions, along with
(savehist-mode t)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

; M-x describe-font
; to read description of the font currently being used

;;; Use color theme 
;===============================================================================
(unless (eq (getenv "TEMP" ) "xterm-mono" )
  (require 'color-theme)
  (when window-system
    (set-face-attribute 'default nil :font "Droid Sans Mono-10" )
    )
  (eval-after-load "color-theme"
    '(color-theme-initialize))
  (color-theme-vim-colors)
       )
;  (color-theme-emacs-nw)
;  (color-theme-jb-simple)
;  (color-theme-scintilla)
;  (color-theme-oswald)


;;; This sets the character '%' to match parenthesys 'VIM style'
;===============================================================================
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)


;;; This sets emacs to ask for confirmation before exiting
;===============================================================================
(defun confirm-exit-emacs ()
        "ask for confirmation before exiting emacs"
        (interactive)
        (if (y-or-n-p "Are you sure you want to exit? ")
                (save-buffers-kill-emacs)))
(global-unset-key "\C-x\C-c")
(global-set-key "\C-x\C-c" 'confirm-exit-emacs)


;;; Set ediff to use only one frame:
;===============================================================================
;(setq ediff-setup-windows-default 2)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;;; The hook is called each time the mode is activated
;;; the right hook has been found with "describe-function"
;;; then the described function is "hs-minor-mode"
;;; and then I clicked on the source code
;;;
;;; TODO:
;;; 1) make only F5 work as a toggle
;;; 2) if a region is selected, it should be called on all hidden
;===============================================================================
(add-hook 'hs-minor-mode-hook 
	  '(lambda () (local-set-key (kbd "<f5>") 'hs-toggle-hiding)))
;===============================================================================

(defun abi-one-buffer-menu()
  "show only file buffers in the main window"
  (interactive)

  (buffer-menu)
  (Buffer-menu-toggle-files-only t)		   
  )

(global-set-key (kbd "<f1>") 
		'abi-one-buffer-menu
		)


;(server-start)


;;; Here begins my elisp samples
;;; Note that thosw have no reason to be here... it is only a file I
;;; find convenient, because I will remember where it is
; this command sets the value of variable "tripleA" to literal "AAA"
; (setq tripleA 'AAA)


;;; USEFULS:
; C-x 8 <return> ;;allows to insert a character from code table
; show-ws-toggle-show-tabs
; show-ws-toggle-show-hard-spaces
; show-ws-toggle-show-trailing-whitespace
; whitespace-mode
; whitespace-cleanup
; 
;
; ### CODE COMPLETION IN LISP !!! ###
; M-<tab> (which can be accessed via esc-tab)

(defun abi-list-buffers
  "Show only buffer in the main window, attached to a file"
  (interactive)
  (buffer-menu)
  (Buffer-menu-toggle-files-only t)
  )

(global-set-key (kbd "<F1>")
		'abi-one-buffer-menu
		)

;;; ACE JUMP MODE
;===============================================================================
;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "/home/gipsy/emacs/ace-jump-mode.el")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

; enable for case insensitiveness
(setq ace-jump-mode-case-fold nil)


;; I should definitely define a function for this replacement
;; \# is a special character that returns the number of replacements already done
;; To overcome this and start at 1, use a dummy ;)
;M-x replace-regexp RET ^ RET \,(format "%c. " (+ ?a \#)) 


;;If you use viper mode :
;(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)


;;; Super-awesome...
;;; convert to/from base!
;(require 'calc-ext)
;;; 
;;; The following gives the representation of 39 in base 20!
; (let ((calc-number-radix 20))
;   (math-format-radix 39))
;
;;; The following gives the binary representation of 123
; (math-format-binary 123)
;;;
;;;Padding some zeroes
;(format "%032d" (string-to-number (math-format-binary 67)))
;
;;; Doing complete representation... of binary 67
;; (let ((a (format "%032d" (string-to-number (math-format-binary 67)))))
;;   (concat (substring a 00 7) " "
;; 	  (substring a 08 15) " "
;; 	  (substring a 16 23) " "
;; 	  (substring a 24 31) " "
;; 	  )
;;   )
