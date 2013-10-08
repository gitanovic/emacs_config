;;; This sets the character '%' to match parenthesys 'VIM style'
;; (defun match-paren (arg)
;;   "Go to the matching paren if on a paren; otherwise insert %."
;;   (interactive "p")
;;   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;; 	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;; 	(t (self-insert-command (or arg 1)))))
;; (global-set-key "%" 'match-paren)


(global-unset-key (kbd "C-%"))
(global-set-key   (kbd "C-%")
		  '(lambda (arg)
		     "% goes to the matching paren if on a paren"
		     (interactive "p")
		     (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
			   ((looking-at "\\s\)") (forward-char 1) (backward-list 1)))))
