;; -*- lexical-binding: t; -*-

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs Loaded in %s."
		     (emacs-init-time))))


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let (
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)

      (file-name-handler-alist nil))

  (require 'init-package)
  (require 'init-font)
  (require 'init-misc)
  (require 'init-keybinding)

  (require 'init-minibuffer)
  (require 'init-complete)
  (require 'init-evil)
  (require 'init-eglot)
  (require 'init-treesit)
  
  (require 'init-lisp)
  )

(provide 'init)
