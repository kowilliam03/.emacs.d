;		       company-dabbrev
;; init-misc.el -*- lexical-binding: t no-byte-compile: t -*-

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


;; Add msys2 in PATH
(setenv "PATH"
	(concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;"	  
	(getenv "PATH")))

(setq frame-inhibit-implied-resize t)

(provide 'init-misc)
