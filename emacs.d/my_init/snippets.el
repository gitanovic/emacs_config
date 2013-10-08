;;; Here begins my elisp samples
;;; Note that thosw have no reason to be here... it is only a file I
;;; find convenient, because I will remember where it is
; this command sets the value of variable "tripleA" to literal "AAA"
; (setq tripleA 'AAA)


;; C-x C-l --> downcase-region
;; C-x C-u --> upcase-region

; M-x describe-font
; to read description of the font currently being used


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


;; Ruler mode
;(ruler-mode 0)
;;; start speedbar
;(when window-system
;  (speedbar t))
;;; Enable to use "END" and "HOME" to work on the "visual line" and not on the "logical line"
;(global-visual-line-mode 1)
;; fill-paragraph
;; fill-region
;; auto-fill-mode

;;; Set lines not wrapping by default
;(setq-default truncate-lines t)

;;; Snippet on how to use conditionals and variables
;; (setq AAA 2)
;; (setq AAA nil)
;; (cond (AAA (prin1 'AAA\ true) (princ ".. really true"))
;;       (t "AAA false")
;;       )
;; (setq AAA (progn
;;        (print "1) ABC\"BLAH\"\nDEF")
;;        (prin1 "2) ABC\"BLAH\"\nDEF")
;;        (princ "3) ABC\"BLAH\"\nDEF")
;;        (pp "4) ABC\"BLAH\"\nDEF")
;;        (print '5\)\ ABC\"BLAH\"\nDEF)
;;        (prin1 '6\)\ ABC\"BLAH\"\nDEF)
;;        (princ '7\)\ ABC\"BLAH\"\nDEF)
;;        (pp '8\)\ ABC\"BLAH\"\nDEF)
;;        ))

;; REGEXP
;; usefull to replace all newlines and beginning spaces in selected region
;; with just a space:
;; 1) select the region
;; 2) M-x replace-regexp
;; 3) C-qC-j\(<SPACE>\|C-q<TAB>\)*<RET>
;; 4) <SPACE><RET>

;; I should definitely define a function for this replacement
;; \# is a special character that returns the number of replacements already done
;; To overcome this and start at 1, use a dummy ;)
;M-x replace-regexp RET ^ RET \,(format "%c. " (+ ?a \#)) 


;;If you use viper mode :
;(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)


;;; Color somethig :)
;;;
;;; Delete all coloring
;(set-text-properties
; (region-beginning)
; (region-end)
; '())
;;;
;;; Color with red
;(add-text-properties
; (region-beginning)
; (region-end) 
; '(face font-lock-warning-face))
;;;
;;; Get text properties at point
;(text-properties-at (point))



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
