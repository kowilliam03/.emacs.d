;;; init-theme.el -*- lexical-binding: t no-byte-compile: t -*-

(require-package 'doom-themes)
(require-package 'doom-modeline)

(setq custom-safe-themes t)

(add-hook 'after-init-hook
	  #'(lambda ()
	      (apply-theme)
	      (doom-modeline-mode 1))
	  )

;; theme setting
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(setq-default current-theme 'doom-one)

(defun apply-theme ()
  (load-theme current-theme)
  (custom-set-variables `(current-theme (quote ,current-theme))))


(defun light ()
  (interactive)
  (setq current-theme 'doom-one-light)
  (apply-theme))


(defun dark ()
  (interactive)
  (setq current-theme 'doom-acario-dark)
  (apply-theme))


;; modeline setting
(with-eval-after-load 'doom-modeline
  (setq doom-modeline-height 16)
  )

(provide 'init-theme)
