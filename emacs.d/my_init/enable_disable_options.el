;;; Configuration of the startup environment
(which-function-mode t)                ; Tell in the modeline which function
(setq inhibit-startup-message    t)    ; Don't want any startup message
(setq make-backup-files          nil)  ; Don't want any backup files
(setq auto-save-list-file-name   nil)  ; Don't want any .saves files
(setq auto-save-default          nil)  ; Don't want any auto saving
(when window-system
    (tool-bar-mode               0)    ; Don't want any tool-bar
    (scroll-bar-mode             0))   ; Don't want any scroll bar
(menu-bar-mode                   0)    ; Don't want any menu-bar
(setq search-highlight           t)    ; Highlight search object
(setq query-replace-highlight    t)    ; Highlight query object
(setq mouse-sel-retain-highlight t)    ; Keep mouse high-lightening
(put 'upcase-region 'disabled nil)
(column-number-mode)
(delete-selection-mode t)              ; Enable deletion of selected txt
(show-paren-mode t)                    ; Enable visualization of matchin parentheses
(setq show-paren-style 'mixed)         ; Better paren match visualization
; (global-linum-mode t)                ;Enables globally to show lines numbers
