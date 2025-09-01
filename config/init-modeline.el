;; -*- lexical-binding: t; -*-

(use-package nerd-icons-completion
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-major-mode-icon t)

  (setq doom-modeline-buffer-file-name-style 'relative-from-project)
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-env-version t)
  (setq doom-modeline-vcs-max-length 20)
  )

(provide 'init-modeline)
