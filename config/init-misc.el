;; -*- lexical-binding: t; -*-

(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
(setq create-lockfiles nil)

(setq inhibit-startup-screen t)
(setq-default case-fold-search t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)

(add-hook 'prog-mode-hook
	  (lambda ()
	     (setq display-line-numbers 'relative)
	     (display-line-numbers-mode 1)))

(set-face-attribute 'default nil
					:font "Sarasa Mono TC" :height 160)


(setq-default tab-width 4)

(show-paren-mode 1)
(setq show-paren-delay 0.1)

(electric-pair-mode 1)

(provide 'init-misc)
