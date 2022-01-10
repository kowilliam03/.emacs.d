;; -*- lexical-binding: t; -*-

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(set-default-coding-systems 'utf-8)
(setq gc-cons-threshold 50000000)

;; Load package & config path
(defun load-path (dir)
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

;; Load config
(load-path "~/.emacs.d/config")
;; Load packages
(load-path "~/.emacs.d/packages/")

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
(require 'init-evil)
(require 'init-lsp)

;; Programming Language
(require 'init-python)


(provide 'init)
