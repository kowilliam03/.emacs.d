;; -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook
	  #'(lambda ()
	      (require 'magit)
	      (global-set-key (kbd "C-x g") 'magit-status)
	      ))

(provide 'init-git)
