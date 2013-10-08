;;; Show the binary representation of the 32-bit based hex function
(defun get-num-from-hex ()
  (interactive)
  (let ((s0 (thing-at-point 'word)))
;    (message "s:%s" s)
    (if  (string= (substring s0 0 2) '0x)
    (let ((o0 (format "echo 'scale=16;ibase=16; obase=2;%s' | bc" 
              (upcase (substring s0 2)))))
      (let ((o1 (shell-command-to-string o0)))
        (let ((o2 (concat (make-string (- 33 (length o1)) ?0 ) o1)))
;        (message "N %032s" o0)
;            (message "N %032d" (string-to-number o1))
            (message " 31  27  23  19  15  11   7   3  0\n  v   v   v   v   v   v   v   v  v\n  %032s" o2))))
      (message "Not an hex number %s" s))))


;;; Bind F8 to the above function
(global-set-key (kbd "<f8>") 'get-num-from-hex)


;;; Set F1 to show buffers being edited
(global-set-key (kbd "<f1>")
		'(lambda ()
		   (interactive)
		   "Show only buffer in the main window, attached to a file"
		   (buffer-menu)
		   (Buffer-menu-toggle-files-only t)))


;(server-start)
