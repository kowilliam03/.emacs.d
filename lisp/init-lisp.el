;; -*- lexical-binding: t; -*-

(when (maybe-require-package 'paredit)
  (require 'paredit)
  (add-hook 'emacs-lisp-mode-hook
	    #'(lambda ()
		(enable-paredit-mode)))
)

(provide 'init-lisp)
