;; -*- lexical-binding: t; -*-

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 5)
						  (projects . 3)
						  (bookmarks . 3)))

  (setq dashboard-startup-banner 'official)
  (setq dashboard-center-content t)
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  )


(provide 'init-dashboard)
