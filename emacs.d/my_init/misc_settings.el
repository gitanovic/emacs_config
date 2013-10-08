;;; set default grep command
(setq grep-find-command "grep -rnH --exclude=.git --include=\*.{c,cpp,h} --include -e 'pattern'")
(global-set-key (kbd "S-<f3>") 'find-grep)


;;; Change line number format to leave a space when on console
(if (not window-system)
    (setq linum-format "%d "))


;(load "folding" 'nomessage 'noerror)
;(folding-mode-add-find-file-hook)

;;; Set ediff to use only one frame (instead of 2)
;(setq ediff-setup-windows-default 2)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;;; Set F5 to hide/show folding
;;; TODO:
;;; if a region is selected, it should be called on all hidden
(add-hook 'hs-minor-mode-hook
	  '(lambda () (local-set-key (kbd "<f5>") 'hs-toggle-hiding)))


(global-unset-key "\M-h")
(global-set-key "\M-h"
		'(lambda () (interactive) (move-to-window-line 0)))


(global-unset-key "\M-j")
(global-set-key "\M-j"
		'(lambda () (interactive) (move-to-window-line -1)))


(put 'downcase-region 'disabled nil)
