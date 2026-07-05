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

;; protect against catastrophic slowdown when a minified/very-long-line file
;; gets opened by accident
(global-so-long-mode 1)

;; large glyph sets (the nerd-icons-* packages draw a lot of icon glyphs)
;; can otherwise trigger expensive font-cache compaction during redisplay
(setq inhibit-compacting-font-caches t)

;; only git is actually used (treemacs-git-mode); skip vc's default
;; per-backend probing for Bzr/Hg/SVN/etc. on every file visit
(setq vc-handled-backends '(Git))

(use-package gcmh
  :ensure t
  :init
  (gcmh-mode 1))

(provide 'init-misc)
