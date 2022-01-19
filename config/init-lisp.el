;; -*- lexical-binding: t; -*-

(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      (enable-paredit-mode)))


(provide 'init-lisp)
