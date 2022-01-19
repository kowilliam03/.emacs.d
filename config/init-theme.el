;; -*- lexical-binding: t; -*-

(setq custom-safe-themes t)

(add-hook 'after-init-hook
	  #'(lambda ()
	      (require 'doom-themes)
	      (apply-theme)
	      (require 'doom-modeline)
	      (doom-modeline-mode 1))
	  )


;; theme setting
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(setq-default current-theme 'doom-one-light)

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
(setq doom-modeline-height 12)

(provide 'init-theme)
