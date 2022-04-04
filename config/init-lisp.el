;;; init-lisp.el -*- lexical-binding: t no-byte-compile: t -*-


(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      (enable-paredit-mode)))

(provide 'init-lisp)
