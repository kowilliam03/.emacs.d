;; -*- lexical-binding: t; -*-
;; Some helper functions

(defun kwn/open-config-folder ()
  "open ./emacs.d/"
  (interactive)
  (find-file "~/.emacs.d/"))

(define-key global-map (kbd "<f1>") #'kwn/open-config-folder)


(provide 'init-utils)
