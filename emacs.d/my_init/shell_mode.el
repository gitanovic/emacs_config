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
