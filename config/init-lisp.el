;;; init-lisp.el -*- lexical-binding: t no-byte-compile: t -*-

(require-package 'paredit)

(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      (enable-paredit-mode)))

(provide 'init-lisp)
