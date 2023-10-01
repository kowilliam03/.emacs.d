;; init-misc.el -*- lexical-binding: t; -*-

(set-default-coding-systems 'utf-8)
(customize-set-variable 'visible-bell 1)

;; Prevent backup files
(setq make-backup-files nil)

;; Improve IO performence
(setq process-adaptive-read-buffering nil
      read-process-output-max (* 1024 1024))

;; replace yes-or-no with y-or-n
(setq use-short-answers t)

(setq frame-inhibit-implied-resize t)

(global-hl-line-mode 1)

(electric-pair-mode 1)

(provide 'init-misc)
