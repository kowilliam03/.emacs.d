;; -*- lexical-binding: t; -*-
;; Some helper functions

(defun kwn/open-config-folder ()
  "open ./emacs.d/"
  (interactive)
  (find-file "~/.emacs.d/"))

(define-key global-map (kbd "<f5>") #'kwn/open-config-folder)

;; Highlight current line
(define-key global-map (kbd "<f1>") #'global-hl-line-mode)

;; Toggle Fullscreem mode
(define-key global-map (kbd "<f11>") #'toggle-frame-fullscreen)

(provide 'init-utils)
