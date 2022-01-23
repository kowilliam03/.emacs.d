;;; init-icon.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'all-the-icons "all-the-icons" "" t)
(autoload 'all-the-icons-dired-mode "all-the-icons-dired" "" t)

(when (display-graphic-p)
  (require 'all-the-icons)
  (require 'all-the-icons-dired)
  (add-hook 'dired-mode-hook
	    'all-the-icons-dired-mode)
)

(provide 'init-icon)
