;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 100 1024 1024))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load-file custom-file))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(require 'init-misc)
(require 'init-path)
(require 'init-evil)
(require 'init-complete)
(require 'init-theme)
(require 'init-modeline)
(require 'init-dashboard)
(require 'init-python)


(add-hook 'emacs-startup-hook
	  (lambda () (setq gc-cons-threshold (* 800 1024))))
