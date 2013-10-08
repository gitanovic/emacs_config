(add-to-list 'load-path "~/emacs")
(add-to-list 'load-path "~/emacs/evil")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
;(add-to-list 'load-path "/etc/emacs/site-start.d")

;;; (load by default) C++ mode for .h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;(require 'evil)
;(evil-mode 1)
(require 'go-mode-load)
(require 'rec-mode)
(add-to-list 'auto-mode-alist '("\\.rec\\'" . rec-mode))


; Save history between sessions, along with kill/search/regex ring
(savehist-mode t)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))


;;; Ask for confirmation before exiting
(defun confirm-exit-emacs ()
        "ask for confirmation before exiting emacs"
        (interactive)
        (if (y-or-n-p "Are you sure you want to exit? ")
                (save-buffers-kill-emacs)))
(global-unset-key "\C-x\C-c")
(global-set-key "\C-x\C-c" 'confirm-exit-emacs)


;;; Just scroll one line when reach window border (not full screen)
(setq scroll-step 1)


;;; Move point when end of buffer is reached during scrolling
(setq scroll-error-top-bottom t)


;;; Enable to have line spacing
;(setq-default line-spacing 0.1)
