;; -*- lexical-binding: t; -*-
;; Install package from Github

(defun kwn/clone-package (package)
  "Clone Repository from Github with submodule"
  (interactive)
  (setq package-name (car (cdr (split-string package "/"))))
  (setq cmd (format "git submodule add https://github.com/%s ../packages/%s" package package-name))
  (message (shell-command-to-string cmd))
  )

;; Load all package's path

;;(load-package-path "~/.emacs.d/packages/")


(provide 'init-package)
