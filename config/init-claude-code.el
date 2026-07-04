;; -*- lexical-binding: t; -*-

(use-package ghostel
  :ensure t)

(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :after ghostel
  :bind ("C-c C-'" . claude-code-ide-menu)
  :config
  (setq claude-code-ide-terminal-backend 'ghostel)
  (claude-code-ide-emacs-tools-setup))

(provide 'init-claude-code)
