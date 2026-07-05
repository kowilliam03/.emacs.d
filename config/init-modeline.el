;; -*- lexical-binding: t; -*-

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)

  (setq doom-modeline-buffer-file-name-style 'relative-from-project)
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-env-version t)
  (setq doom-modeline-vcs-max-length 20)

  (setq doom-modeline-lsp t)
  (setq doom-modeline-check-simple-format t)
  )

(provide 'init-modeline)
