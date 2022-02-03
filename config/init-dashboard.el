;;; init-dashboard.el -*- lexical-binding: t no-byte-compile: t -*-

(add-hook 'after-init-hook
	  #'(lambda ()
	      (require 'dashboard)

	      (setq dashboard-banner-logo-title "Welcome to Emacs")
	      (setq dashboard-startup-banner 2)
	      (setq dashboard-center-content t)

	      (setq dashboard-set-heading-icons t
		    dashboard-set-file-icons t)

	      (setq dashboard-set-navigator t)

	      (setq dashboard-items '((recents . 5)))

	      (dashboard-setup-startup-hook)
	      ))

(provide 'init-dashboard)
