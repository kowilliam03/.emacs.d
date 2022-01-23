;;; init-utils.el -*- lexical-binding: t no-byte-compile: t -*-
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


(defun kwn/init-config-file ()
"enable lexical-binding & disable code-byte compile"
(interactive)
(let (file-name)
  (setq file-name (car (split-string (buffer-name) "\\.")))
  (progn
    (goto-char (point-min))
    (insert (format ";;; %s.el -*- lexical-binding: t no-byte-compile: t -*-" file-name))
    (insert "\n\n")
    (goto-char (point-max))
    (insert (format "(provide '%s)" file-name))
    (forward-line -2)
    ))
)

(provide 'init-utils)
