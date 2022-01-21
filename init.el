;; -*- lexical-binding: t; -*-

;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (message "*** Emacs loaded in %s with %d garbage collections."
;;                      (format "%.2f seconds"
;;                              (float-time
;;                               (time-subtract after-init-time before-init-time)))
;;                      gcs-done)))

;; Full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))



;; Load package & config path
(defun load-path (dir)
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))


(let (
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))
  ;; Load config
  (load-path "~/.emacs.d/config")
  ;; Load packages
  (load-path "~/.emacs.d/packages/")
  (require 'init-dashboard)
  (require 'init-utils)
  (require 'init-misc)
  (require 'init-package)
  (require 'init-buffer)
  (require 'init-minibuffer)

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

  ;; Programming Language
  (require 'init-python)
  (require 'init-lisp)

  (server-start)
  )

(provide 'init)
