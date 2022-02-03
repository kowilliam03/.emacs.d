;;; init-yasnippet.el -*- lexical-binding: t no-byte-compile: t -*-

(add-hook 'prog-mode-hook
	  #'(lambda ()
	      (require 'yasnippet)
	      (yas-global-mode 1)
	      )
	  )

(provide 'init-yasnippet)
