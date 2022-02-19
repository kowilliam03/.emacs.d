;;; init.el -*- lexical-binding: t no-byte-compile: t -*-

;; Full screen
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))



;; Load package & config path
(defun load-path (dir)
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

;; Load config
(load-path "~/.emacs.d/config")
;; Load packages
;;(load-path "~/.emacs.d/packages/")


(let (
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))
  (require 'init-package)
  (require 'init-dashboard)
  (require 'init-utils)
  (require 'init-misc)
  (require 'init-buffer)
  (require 'init-minibuffer)
  (require 'init-keybinding)

  ;; UI
  (require 'init-font)
  (require 'init-icon)
  (require 'init-theme)
  
  (require 'init-dired)
  
  ;; Develop tools
  (require 'init-company)
  (require 'init-git)
  (require 'init-evil)
  (require 'init-lsp)
  (require 'init-yasnippet)

  ;; Programming Language
  (require 'init-prog)
  (require 'init-python)
  (require 'init-lisp)
  
  (server-start)
  )
