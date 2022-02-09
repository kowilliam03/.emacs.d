;;; init-prog.el -*- lexical-binding: t no-byte-compile: t -*-

(add-hook 'prog-mode-hook
	  #'(lambda ()
	      (progn
		(electric-pair-mode 1)
		(display-line-numbers-mode)
		(yas-global-mode 1)
		)))

(provide 'init-prog)
