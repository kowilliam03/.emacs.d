;; -*- lexical-binding: t; -*-

;; prevent backup files
(setq make-backup-files nil)

(setq-default custom-file null-device)

;; Imporve IO performence
(setq process-adaptive-read-buffering nil)
(setq read-process-output-max (* 1024 1024))

;; replace yse-or-no with y-or-n
(fset 'yes-or-no-p 'y-or-n-p)
;; disable ring bell
(setq ring-bell-function 'ignore)

(set-default-coding-systems 'utf-8)

(provide 'init-misc)
