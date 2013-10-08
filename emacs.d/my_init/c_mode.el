(defun c_cpp_modes ()
;  (gtags-mode t)
  (hs-minor-mode t)
  (highlight-regexp "\/\/ *TO[ _-]?DO" "hi-yellow")
  (highlight-regexp "[     ]+$" "hi-pink")
  (setq indent-tabs-mode nil)
  (setq truncate-lines t))


(add-hook 'c-mode-hook 'c_cpp_modes)
(add-hook 'c++-mode-hook 'c_cpp_modes)

;(global-set-key (kbd "<f9>") 'gtags-find-tag-from-here)
;(global-set-key (kbd "<f12>") 'gtags-pop-stack)
