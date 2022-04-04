;;; init-icon.el -*- lexical-binding: t no-byte-compile: t -*-

(when (display-graphic-p)
  (require 'all-the-icons)
  (require 'all-the-icons-dired)
  (add-hook 'dired-mode-hook
	    'all-the-icons-dired-mode)
)

(provide 'init-icon)
