;;; init.el -*- lexical-binding: t no-byte-compile: t -*-

;; Full screen
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq default-frame-alist '((width . 120) (height . 55) (menu-bar-lines . 1)))


(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))


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

  ;; Other
  (require 'init-gc)
  
  (server-start)
  )
