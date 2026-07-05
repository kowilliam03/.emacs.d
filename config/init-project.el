;; -*- lexical-binding: t; -*-


(use-package treemacs
  :ensure t
  :defer t
  :after (evil project)
  :bind
  (("<f8>" . treemacs)
   ("M-0" . treemacs-select-window)
   ("C-x t 1" . treemacs-delete-other-windows)
   ("C-x t t" . treemacs)
   ("C-x t f" . treemacs-find-file)
   ("C-x t B" . treemacs-bookmark)
   ("C-x t C-t" . treemacs-find-tag))

  :config
  (setq  treemacs-follow-after-init t
		 treemacs-expand-after-init t
		 treemacs-indent-guide-style 'line
		 treemacs-indentation 2
		 treemacs-git-mode 'simple
		 treemacs-sorting 'alphabetic-asc)

  (treemacs-project-follow-mode 1)
  (treemacs-follow-mode 1)
  (treemacs-git-mode 'simple)

  (defun +treemacs-auto-show ()
	(when (and (project-current)
			   (eq (treemacs-current-visibility) 'none))
	  (treemacs-add-and-display-current-project-exclusively)))

  (add-hook 'find-file-hook #'+treemacs-auto-show)
  (add-hook 'treemacs-mode-hook (lambda () (display-line-numbers-mode -1)))
  )

(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-nerd-icons-config))


(provide 'init-project)
