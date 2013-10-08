;;; highlight tabs in python mode
(add-hook 'python-mode-hook
    '(lambda () 
       (highlight-regexp "	+" "hi-pink")))
