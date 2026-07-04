;; -*- lexical-binding: t; -*-


(require 'package)
;; (package-initialize)

(load custom-file 'noerror)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(require 'init-misc)
(require 'init-path)
(require 'init-evil)
(require 'init-complete)
(require 'init-theme)
(require 'init-modeline)
(require 'init-dashboard)
(require 'init-python)
(require 'init-llm)
(require 'init-project)


(add-hook 'emacs-startup-hook
	  (lambda () (setq gc-cons-threshold (* 800 1024))))
