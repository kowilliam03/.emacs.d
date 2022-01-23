;;; init-lisp.el -*- lexical-binding: t no-byte-compile: t -*-

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      (enable-paredit-mode)))

(provide 'init-lisp)
